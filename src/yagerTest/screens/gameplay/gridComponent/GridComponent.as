package yagerTest.screens.gameplay.gridComponent 
{
	import com.gskinner.motion.plugins.SnappingPlugin;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import yagerTest.screens.gameplay.gridComponent.GridPositionHelper;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridComponent extends ViewComponent 
	{
		private var rows:int;
		private var cols:int;
		private var tileSize:Number;
		
		private var marker:Sprite;
		
		public function GridComponent(rows:int, cols:int, tileSize:Number) 
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
			addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		override protected function destroy():void
		{
			super.destroy();
			removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		
		private function initBackground():void
		{
			var background:Sprite = new Sprite();
			background.graphics.beginFill(0x000055);
			background.graphics.drawRect(0, 0, rows * tileSize, cols * tileSize);
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
		
		private function onMouseMove(event:MouseEvent):void
		{
			snapMarker(event.localX, event.localY);
		}
		
		private function snapMarker(localX:Number, localY:Number):void
		{
			if (localX < width && localY < height)
			{
				var snappedPosition:Point = GridPositionHelper.snapPosition(new Point(localX, localY), tileSize, tileSize);
				marker.x = snappedPosition.x;// * tileSize + tileSize / 2.0;
				marker.y = snappedPosition.y;// * tileSize + tileSize / 2.0;
			}
		}
		

		
	}

}