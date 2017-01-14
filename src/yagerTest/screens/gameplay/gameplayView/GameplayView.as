package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayView extends ViewComponent implements IGameplayView
	{
		private var rows:int;
		private var cols:int;
		private var tileSize:Number;
		
		private var marker:Sprite;
		private var _selectDestinationSignal:Signal = new Signal(Point);
		
		public function GameplayView(rows:int, cols:int, tileSize:Number) 
		{
			super();
			this.rows = rows;
			this.cols = cols;
			this.tileSize = tileSize;
		}
		
		override protected function init():void
		{
			super.init();
			initBackground();
			initMarker();
			initMouseListeners();
		}
		
		private function initMouseListeners():void 
		{
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function removeMouseListeners():void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(event:MouseEvent):void 
		{
			var gridPosition:Point = GridPositionHelper.pixelToGrid(new Point(event.localX, event.localY), tileSize, tileSize);
			selectDestinationSignal.dispatch(gridPosition);
		}
		
		private function onMouseMove(event:MouseEvent):void
		{
			snapMarker(event.localX, event.localY);
		}
		
		override protected function destroy():void
		{
			removeMouseListeners();
			super.destroy();
		}
		
		private function initBackground():void
		{
			var background:Sprite = new Sprite();
			background.graphics.beginFill(0xffaaaa);
			background.graphics.drawRoundRect(0, 0, rows * tileSize, cols * tileSize, 20, 20);
			background.graphics.endFill();
			addChild(background);
		}
		
		private function initMarker():void
		{
			marker = new Sprite();
			marker.graphics.beginFill(0xffffff, 1.0);
			marker.graphics.drawCircle( 0, 0, tileSize/2.0);
			marker.graphics.endFill();
			marker.mouseEnabled = false;
			addChild(marker);
		}
		
		private function snapMarker(localX:Number, localY:Number):void
		{
			if (localX < width && localY < height)
			{
				var snappedPosition:Point = GridPositionHelper.snapPosition(new Point(localX, localY), tileSize, tileSize);
				marker.x = snappedPosition.x;
				marker.y = snappedPosition.y;
			}
		}
		
		public function get selectDestinationSignal():Signal 
		{
			return _selectDestinationSignal;
		}
		

		
	}

}