package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.factories.gameObjects.ActorsFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.screens.gameplay.actors.MovementComponent;
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
		private var marker:Sprite;
		private var _moveRequestSignal:Signal = new Signal(Point, Point);
		
		private var movementComponent:MovementComponent;
		
		private var coins:Vector.<Sprite> = new Vector.<Sprite>();
		
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
		
		override protected function init():void
		{
			super.init();
			initBackground();
			initMarker();
			initPlayer();
			initMouseListeners();
		}
		
		private function initPlayer():void
		{
			playerAvatar = ActorsFactory.createAvatarByType(GameObjectTypes.PLAYER);
			movementComponent = new MovementComponent(playerAvatar, cellSize, 1200.0);
			
			var spawnPosition:Point = GridPositionHelper.gridToPixelPosition(new Point(10, 10), cellSize);
			playerAvatar.x = spawnPosition.x;
			playerAvatar.y = spawnPosition.y;
			addChild(playerAvatar);
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
			var gridPosition:Point = GridPositionHelper.pixelToGrid(
				getInboundPosition(mouseX, mouseY), cellSize
			);
				
			var start:Point = GridPositionHelper.pixelToGrid(new Point(playerAvatar.x, playerAvatar.y), cellSize);
			moveRequestSignal.dispatch(start, gridPosition);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			var inBoundPosition:Point = getInboundPosition(mouseX, mouseY);
			var gridPosition:Point = GridPositionHelper.pixelToGrid(inBoundPosition, cellSize);
			highlightCell(gridPosition);
		}
		
		// Fix pixel position to be sure it can be converted to a valid grid point
		private function getInboundPosition(x:Number, y:Number):Point
		{
			var inboundPoint:Point = new Point();
			inboundPoint.x = Math.min(Math.max(x, 0), width - 1);
			inboundPoint.y = Math.min(Math.max(y, 0), height - 1);
			return inboundPoint;
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
		
		private function initMarker():void
		{
			marker = new Sprite();
			marker.graphics.beginFill(0xffffff, 1.0);
			marker.graphics.drawCircle(0, 0, cellSize.x/2.0);
			marker.graphics.endFill();
			marker.mouseEnabled = false;
			addChild(marker);
		}
		
		private function highlightCell(gridPosition:Point):void
		{
			if (gridPosition.x < gridSize.x && gridPosition.y < gridSize.y)
			{
				var snappedPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, cellSize);
				marker.x = snappedPosition.x;
				marker.y = snappedPosition.y;
			}
		}
		
		public function addCoin(gridPosition:Point):void
		{
			var coinAvatar:Sprite = ActorsFactory.createAvatarByType(GameObjectTypes.COIN);
			coins.push(coinAvatar);
			var pixelPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, cellSize);
			coinAvatar.x = pixelPosition.x;
			coinAvatar.y = pixelPosition.y;
			addChild(coinAvatar);
		}
		
	}

}