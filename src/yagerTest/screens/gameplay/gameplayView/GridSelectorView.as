package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import yagerTest.factories.gameObjects.GameObjectAvatarFactory;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridSelectorView extends ViewComponent 
	{
		
		private var pointer:Sprite;
		private var cellSize:Point;
		private var gridSize:Point;
		private var selectedCell:Point = new Point();
		
		public function GridSelectorView(gridSize:Point, cellSize:Point):void
		{
			this.gridSize = gridSize;
			this.cellSize = cellSize;
		}
		
		override protected function init():void
		{
			super.init();
			initPointer();
		}
		
		private function initPointer():void
		{
			pointer = GameObjectAvatarFactory.createCircleAvatar(0xffffff, cellSize.x / 4);
			addChild(pointer);
		}
		
		private function highlightCell(gridPosition:Point):void
		{
			gridPosition.x = Math.min(Math.max(gridPosition.x, 0), gridSize.x - 1);
			gridPosition.y = Math.min(Math.max(gridPosition.y, 0), gridSize.y - 1);
			selectedCell.copyFrom(gridPosition);

			var snappedPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, cellSize);
			pointer.x = snappedPosition.x;
			pointer.y = snappedPosition.y;
		}
		
		public function selectPixelPosition(mouseX:Number, mouseY:Number):void 
		{
			var inBoundPosition:Point = getInboundPosition(mouseX, mouseY);
			highlightCell(GridPositionHelper.pixelToGrid(inBoundPosition, cellSize));
		}
		
		// Fix pixel position to be sure it can be converted to a valid grid point
		private function getInboundPosition(x:Number, y:Number):Point
		{
			var inboundPoint:Point = new Point();
			inboundPoint.x = Math.min(Math.max(x, 0), parent.width - 1);
			inboundPoint.y = Math.min(Math.max(y, 0), parent.height - 1);
			return inboundPoint;
		}
		
		public function getSelectedPosition():Point
		{
			return selectedCell.clone();
		}
		
	}

}