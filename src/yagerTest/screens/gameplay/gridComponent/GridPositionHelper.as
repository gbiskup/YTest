package yagerTest.screens.gameplay.gridComponent 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridPositionHelper 
	{
		
		public static function snapPosition(pixelPosition:Point, gridCellWidth:Number, gridCellHeight:Number):Point
		{
			pixelPosition = pixelToGrid(pixelPosition, gridCellWidth, gridCellHeight);
			return gridToPixelPosition(pixelPosition, gridCellWidth, gridCellHeight);
			
		}
		
		public static function gridToPixelPosition(gridPosition:Point, gridCellWidth:Number, gridCellHeight:Number):Point
		{
			gridPosition.x = (gridPosition.x + 0.5) * gridCellWidth;
			gridPosition.y = (gridPosition.y + 0.5) * gridCellHeight;
			return gridPosition;
		}
		
		public static function pixelToGrid(pixelPositon:Point, gridCellWidth:Number, gridCellHeight:Number):Point
		{
			pixelPositon.x = int(pixelPositon.x / gridCellWidth);
			pixelPositon.y = int(pixelPositon.y / gridCellHeight);
			return pixelPositon;
		}
		
	}

}