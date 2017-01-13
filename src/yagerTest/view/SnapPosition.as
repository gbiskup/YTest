package yagerTest.view 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class SnapPosition 
	{
		
		public static function snapPosition(x:Number, y:Number, snapWidth:Number, snapHeight:Number):Point
		{
			var snappedPoint:Point = new Point();
			snappedPoint.x = int(x / snapWidth + 1) * snapWidth;
			snappedPoint.y = int(y / snapHeight + 1) * snapHeight;
			return snappedPoint;
		}
		
	}

}