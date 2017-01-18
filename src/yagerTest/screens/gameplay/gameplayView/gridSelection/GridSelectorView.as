package yagerTest.screens.gameplay.gameplayView.gridSelection 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import yagerTest.factories.gameObjects.GameObjectAvatarFactory;
	import yagerTest.model.Size;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.view.basicViewComponent.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridSelectorView extends ViewComponent 
	{
		private var pointer:Sprite;
		private var cellSize:Point;
		private var gridSize:Size;
		private var selectedCell:Point = new Point();
		
		private var checkCellAvailability:Function;
		
		public function GridSelectorView(gridSize:Size, cellSize:Point, cellAvailabilityFunction:Function = null):void
		{
			this.gridSize = gridSize.clone();
			this.cellSize = cellSize.clone();
			this.checkCellAvailability = cellAvailabilityFunction;
		}
		
		override protected function init():void
		{
			super.init();
			initPointer();
		}
		
		private function initPointer():void
		{
			pointer = new Sprite();
			pointer.graphics.lineStyle(2, 0xffffff);
			pointer.graphics.drawRoundRect(-cellSize.x/2, -cellSize.y/2, cellSize.x, cellSize.y, 4, 4);
			
			addChild(pointer);
		}
		
		private function highlightCell(gridPosition:Point):void
		{
			gridPosition.x = Math.min(Math.max(gridPosition.x, 0), gridSize.width - 1);
			gridPosition.y = Math.min(Math.max(gridPosition.y, 0), gridSize.height - 1);
			
			if (checkCellAvailability == null || checkCellAvailability(gridPosition))
			{
				selectedCell.copyFrom(gridPosition);
				
				var snappedPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, cellSize);
				pointer.x = snappedPosition.x;
				pointer.y = snappedPosition.y;
			}
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