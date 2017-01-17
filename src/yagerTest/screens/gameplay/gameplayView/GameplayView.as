package yagerTest.screens.gameplay.gameplayView 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.factories.gameObjects.GameObjectAvatarFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GridModel;
	import yagerTest.screens.gameplay.gameplayView.actors.GameObject;
	import yagerTest.screens.gameplay.gameplayView.actors.MovementComponent;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.screens.gameplay.gameplayView.gridSelection.GridSelectorView;
	import yagerTest.view.AlignDisplayObject;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayView extends ViewComponent implements IGameplayView
	{
		private static const RESPAWN_COINS_TIMELINE_LABEL:String = "respawn_coins";
		
		private var _moveRequestSignal:Signal = new Signal(Point);
		
		private var _timeUpdatedSignal:Signal = new Signal();

		private var _gameActionRequestSignal:Signal = new Signal(String);
		
		private var cellSize:Point;

		private var gridSize:Point;
		
		private var player:GameObject;
	
		private var movementComponent:MovementComponent;
		
		private var coins:Vector.<GameObject> = new Vector.<GameObject>();
		
		private var gridSelector:GridSelectorView;
		
		private var timeLine:GTweenTimeline = new GTweenTimeline();
		
		private var gridModel:GridModel;
		
		public function GameplayView(gridSize:Point, cellSize:Point)
		{
			super();
			this.gridSize = gridSize;
			this.cellSize = cellSize;
		}
		
		public function movePlayer(path:Vector.<Point>):void 
		{
			movementComponent.followPath(path);
		}
		
		public function pause():void 
		{
			timeLine.paused = true;
			movementComponent.pause();
			removeMouseListeners();
			visible = false;
		}
		
		public function resume():void 
		{
			movementComponent.resume();
			addMouseListeners();
			visible = true;
		}
		
		override protected function constructChildren():void
		{
			super.constructChildren();
			initBackground();
			initGridSelector();
		}
		
		override protected function init():void
		{
			super.init();
			addMouseListeners();
		}
		
		private function initGridSelector():void
		{
			gridSelector = new GridSelectorView(gridSize, cellSize, checkGridPosition);
			addChildComponent(gridSelector);
		}
		
		private function checkGridPosition(position:Point):Boolean
		{
			return gridModel && gridModel.getObjectTypeAt(position.x, position.y) != GameObjectTypes.OBSTACLE;
		}
		
		private function addMouseListeners():void 
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function removeMouseListeners():void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(event:MouseEvent):void 
		{
			moveRequestSignal.dispatch(gridSelector.getSelectedPosition());
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			gridSelector.selectPixelPosition(mouseX, mouseY);
		}
		
		override protected function destroy():void
		{
			pause();
			super.destroy();
		}
		
		private function initBackground():void
		{
			var background:Sprite = new Sprite();
			background.graphics.beginFill(0xffaaaa);
			background.graphics.drawRoundRect(0, 0, gridSize.x * cellSize.x, gridSize.y * cellSize.y, 20, 20);
			background.graphics.endFill();
			addChild(background);
		}
		
		public function showGrid(grid:GridModel, filter:Array = null):void 
		{
			gridModel = grid;
			var currentPosition:Point = new Point();
			for (var y:int = 0; y < grid.height; y++)
			{
				for (var x:int = 0; x < grid.width; x++)
				{
					currentPosition.setTo(x, y);
					var objectTypeAtPosition:int = grid.getObjectTypeAt(x, y);
					if (filter == null || filter.indexOf(objectTypeAtPosition) >= 0)
					{
						addGameObject(currentPosition, objectTypeAtPosition);
					}
				}
			}
		}
		
		private function addGameObject(gridPosition:Point, objectType:int):void
		{
			if (objectType != GameObjectTypes.EMPTY)
			{
				var avatar:Sprite = GameObjectAvatarFactory.createAvatarByType(objectType);
				AlignDisplayObject.customAlign(avatar, GridPositionHelper.gridToPixelPosition, gridPosition, cellSize);
				var gameObject:GameObject = new GameObject(gridPosition.clone(), avatar);
				addChild(avatar);
				if (objectType == GameObjectTypes.COIN)
				{
					coins.push(gameObject);
				}
				if (objectType == GameObjectTypes.PLAYER)
				{
					initPlayer(gameObject);
				}
			}
		}
		
		private function initPlayer(gameObject:GameObject):void
		{
			if (!this.player)
			{
				this.player = gameObject;
				movementComponent = new MovementComponent(player.avatar, cellSize, GameplayConstants.PLAYER_SPEED);
			}
		}
		
		public function startTime(timeLimit:Number):void
		{
			timeLine.duration = timeLimit;
			timeLine.onComplete = timeComplete;
			timeLine.onChange = timeChange;
			timeLine.gotoAndPlay(0);
		}
		
		
		public function removeAllCoins():void 
		{
			for (var i:int = coins.length - 1; i >= 0; i--)
			{
				removeChild(coins[i].avatar);
			}
			coins.length = 0;
		}
		
		public function setCoinsRespawnTime(coinsRespawnTime:Number):void 
		{
			timeLine.removeCallback(RESPAWN_COINS_TIMELINE_LABEL);
			timeLine.addLabel(timeLine.position + coinsRespawnTime, RESPAWN_COINS_TIMELINE_LABEL);
			timeLine.addCallback(RESPAWN_COINS_TIMELINE_LABEL, spawnCoinsCallback);			
		}
		
		private function timeComplete(tween:GTween):void
		{
			gameActionRequestSignal.dispatch(GameplayActions.GAME_OVER);
		}
		
		private function spawnCoinsCallback():void
		{
			gameActionRequestSignal.dispatch(GameplayActions.SPAWN_COINS);
		}
		
		public function getPlayerGridPosition():Point
		{
			return player.gridPosition;
		}
		
		public function removeCoin(gridPosition:Point):void 
		{
			for (var i:int = coins.length - 1; i >= 0; i--)
			{
				if (coins[i].gridPosition.equals(gridPosition))
				{
					removeChild(coins[i].avatar);
					coins.splice(i, 1);
				}
			}
		}
		
		private function timeChange(tween:GTween):void
		{
			updatePlayer();
			timeUpdatedSignal.dispatch();
			//timeLabel.setValue(timeLimit - tween.position);
		}
		
		private function updatePlayer():void
		{
			var pixelPosition:Point = new Point(player.avatar.x, player.avatar.y)
			player.gridPosition = GridPositionHelper.pixelToGrid(pixelPosition, cellSize);
		}
		
		public function get moveRequestSignal():Signal 
		{
			return _moveRequestSignal;
		}
		
		public function get gameActionRequestSignal():Signal 
		{
			return _gameActionRequestSignal;
		}
		
		public function get timeUpdatedSignal():Signal 
		{
			return _timeUpdatedSignal;
		}
	}

}