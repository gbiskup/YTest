package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.factories.gameObjects.GameObjectAvatarFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GridModel;
	import yagerTest.screens.gameplay.gameplayView.actors.MovementComponent;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayView extends ViewComponent implements IGameplayView
	{
		private var cellSize:Point;
		private var gridSize:Point;
		
		private var playerAvatar:Sprite;
		private var _moveRequestSignal:Signal = new Signal(Point, Point);
		
		private var movementComponent:MovementComponent;
		
		private var coins:Vector.<Sprite> = new Vector.<Sprite>();
		
		private var gridSelector:GridSelectorView;
		
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
			movementComponent.pause();
			removeMouseListeners();
			visible = false;
		}
		
		public function resume():void 
		{
			movementComponent.resume();
			initMouseListeners();
			visible = true;
		}
		
		public function get moveRequestSignal():Signal 
		{
			return _moveRequestSignal;
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
			initMouseListeners();
		}
		
		private function initGridSelector():void
		{
			gridSelector = new GridSelectorView(gridSize, cellSize);
			addChildComponent(gridSelector);
		}
		
		private function initMouseListeners():void 
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
			var start:Point = GridPositionHelper.pixelToGrid(new Point(playerAvatar.x, playerAvatar.y), cellSize);
			moveRequestSignal.dispatch(start, gridSelector.getSelectedPosition());
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			gridSelector.selectPixelPosition(mouseX, mouseY);
		}
		
		override protected function destroy():void
		{
			removeMouseListeners();
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
				var pixelPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, cellSize);
				avatar.x = pixelPosition.x;
				avatar.y = pixelPosition.y;
				addChild(avatar);
				if (objectType == GameObjectTypes.COIN)
				{
					coins.push(avatar);
				}
				if (objectType == GameObjectTypes.PLAYER)
				{
					initPlayer(avatar);
				}
			}
		}
		
		private function initPlayer(avatar:Sprite):void
		{
			if (!playerAvatar)
			{
				playerAvatar = avatar;
				movementComponent = new MovementComponent(playerAvatar, cellSize, GameplayConstants.PLAYER_SPEED);
			}
		}
	}

}