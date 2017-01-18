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
	import yagerTest.model.Size;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.screens.gameplay.gameplayView.actors.GameObject;
	import yagerTest.screens.gameplay.gameplayView.actors.MovementComponent;
	import yagerTest.screens.gameplay.gameplayView.gridSelection.GridSelectorView;
	import yagerTest.view.basicViewComponent.ViewComponent;
	import yagerTest.view.utilities.AlignDisplayObject;
	
	/**
	 * Main gameplay view. Shows output and handles interactions.
	 * @author gbiskup
	 */
	public class GameplayView extends ViewComponent implements IGameplayView
	{
		// Used to schedule coin spawn actions on timeline
		private static const RESPAWN_COINS_TIMELINE_LABEL:String = "respawn_coins";
		private static const REMOVE_COINS_TIMELINE_LABEL:String = "remove_coins";
		
		private var _moveRequestSignal:Signal = new Signal(Point);
		
		private var _timeUpdatedSignal:Signal = new Signal();

		private var _gameActionRequestSignal:Signal = new Signal(String);
		
		private var cellSize:Point;

		private var gridSize:Size;
		
		private var player:GameObject;
	
		// Handles player movements
		private var movementComponent:MovementComponent;
		
		private var coins:Vector.<GameObject> = new Vector.<GameObject>();
		
		// Converts mouse position to grid position and stores selected tile.
		private var gridSelector:GridSelectorView;
		
		// Handles game time flow
		private var timeLine:GTweenTimeline = new GTweenTimeline();
		
		// Provides level definition
		private var gridModel:GridModel;
		
		public function GameplayView(gridSize:Size, cellSize:Point)
		{
			super();
			this.gridSize = gridSize.clone();
			this.cellSize = cellSize.clone();
		}
		
		/**
		 * Move player through all grid waypoints from the given vector with constant speed.
		 */
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
			timeLine.paused = false;
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
			gridSelector = new GridSelectorView(gridSize, cellSize, isGridPositionWalkable);
			addChildComponent(gridSelector);
		}
		
		private function isGridPositionWalkable(position:Point):Boolean
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
			gridSelector.selectTileAtPixelPosition(mouseX, mouseY);
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
			background.graphics.drawRoundRect(0, 0, gridSize.width * cellSize.x, gridSize.height * cellSize.y, 20, 20);
			background.graphics.endFill();
			addChild(background);
		}
		
		/**
		 * Draws all game objects from the grid. Optionally only draws objects with type present in filter array.
		 */
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
		
		/**
		 * Creates game objects avatars and adds them to the view. Saves references to coins and player.
		 */
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
		
		/**
		 * Draws all game objects from the grid. Optionally only draws objects with type present in filter array.
		 */
		public function removeAllCoins():void 
		{
			for (var i:int = coins.length - 1; i >= 0; i--)
			{
				removeChild(coins[i].avatar);
			}
			coins.length = 0;
		}
		
		/**
		 * Schedules next coins respawn and coins remove actions.
		 * @param coinsRespawnTime Delay to trigger coins spawn request
		 * @param removeAfter Delay to trigger coins remove request after their spawn
		 */
		public function setCoinsRespawnTime(coinsRespawnTime:Number, removeAfter:Number):void 
		{
			var callbackTime:Number = timeLine.position + coinsRespawnTime;
			timeLine.addLabel(callbackTime, RESPAWN_COINS_TIMELINE_LABEL);
			timeLine.addCallback(RESPAWN_COINS_TIMELINE_LABEL, triggerGameActionSignal, [GameplayActions.SPAWN_COINS]);
			timeLine.addLabel(callbackTime + removeAfter, REMOVE_COINS_TIMELINE_LABEL);
			timeLine.addCallback(REMOVE_COINS_TIMELINE_LABEL, triggerGameActionSignal, [GameplayActions.REMOVE_COINS]);
		}
		
		private function triggerGameActionSignal(type:String):void
		{
			gameActionRequestSignal.dispatch(type);
		}
		
		public function getPlayerGridPosition():Point
		{
			return player.gridPosition;
		}
		
		/**
		 * Removes a coin at given grid position.
		 */
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
		
		/**
		 * Returns seconds of gameplay since the game started.
		 */
		public function getElapsedSeconds():Number 
		{
			return timeLine.position;
		}
		
		private function timeChange(tween:GTween):void
		{
			updatePlayerPosition();
			timeUpdatedSignal.dispatch();
		}
		
		private function timeComplete(tween:GTween):void
		{
			gameActionRequestSignal.dispatch(GameplayActions.GAME_OVER);
		}
		
		private function updatePlayerPosition():void
		{
			var pixelPosition:Point = new Point(player.avatar.x, player.avatar.y)
			player.gridPosition = GridPositionHelper.pixelToGrid(pixelPosition, cellSize);
		}
		
		/**
		 * Dispatches move requests when user clicks on free tile. Target grid position as a parameter.
		 */
		public function get moveRequestSignal():Signal 
		{
			return _moveRequestSignal;
		}
		
		/**
		 * Requests game actions defined in GameplayAction class.
		 */
		public function get gameActionRequestSignal():Signal 
		{
			return _gameActionRequestSignal;
		}
		
		/**
		 * Signal dispatched on every time change (every frame). Calls listeners with no parameters.
		 */
		public function get timeUpdatedSignal():Signal 
		{
			return _timeUpdatedSignal;
		}
	}

}
