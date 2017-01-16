package yagerTest.screens.gameplay.gameplayView 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridPositionHelper 
	{
		
		public static function snapPosition(pixelPosition:Point, gridCellWidth:Number, gridCellSize:Point):Point
		{
			pixelPosition = pixelToGrid(pixelPosition, gridCellSize);
			return gridToPixelPosition(pixelPosition, gridCellSize);
		}
		
		public static function gridToPixelPosition(gridPosition:Point, gridCellSize:Point):Point
		{
			gridPosition.x = int((gridPosition.x + 0.5) * gridCellSize.x);
			gridPosition.y = int((gridPosition.y + 0.5) * gridCellSize.y);
			return gridPosition;
		}
		
		public static function pixelToGrid(pixelPositon:Point, gridCellSize:Point):Point
		{
			pixelPositon.x = int(pixelPositon.x / gridCellSize.x);
			pixelPositon.y = int(pixelPositon.y / gridCellSize.y);
			return pixelPositon;
		}
		
	}

}