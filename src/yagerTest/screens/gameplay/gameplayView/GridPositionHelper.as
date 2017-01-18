package yagerTest.screens.gameplay.gameplayView 
{
	import flash.geom.Point;
	
	/**
	 * Provides static interface for conversions between pixel and grid coordinates.
	 * @author gbiskup
	 */
	public class GridPositionHelper 
	{
		
		/**
		 * Returns pixel position snapped to the nearest grid cell center.
		 */
		public static function snapPosition(pixelPosition:Point, gridCellWidth:Number, gridCellSize:Point):Point
		{
			var gridPosition:Point = pixelToGrid(pixelPosition, gridCellSize);
			return gridToPixelPosition(gridPosition, gridCellSize);
		}
		
		public static function gridToPixelPosition(gridPosition:Point, gridCellSize:Point):Point
		{
			var pixelPosition:Point = new Point();
			pixelPosition.x = int((gridPosition.x + 0.5) * gridCellSize.x);
			pixelPosition.y = int((gridPosition.y + 0.5) * gridCellSize.y);
			return pixelPosition;
		}
		
		public static function pixelToGrid(pixelPositon:Point, gridCellSize:Point):Point
		{
			var gridPosition:Point = new Point();
			gridPosition.x = int(pixelPositon.x / gridCellSize.x);
			gridPosition.y = int(pixelPositon.y / gridCellSize.y);
			return gridPosition;
		}
		
	}

}