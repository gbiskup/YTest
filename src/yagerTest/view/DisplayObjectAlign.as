package yagerTest.view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class DisplayObjectAlign 
	{
		// Allings center of the display object to the center of the bounds rect.
		public static function center(displayObject:DisplayObject, bounds:Rectangle):void
		{
			displayObject.x = bounds.width / 2 - displayObject.width / 2;
			displayObject.y = bounds.height / 2 - displayObject.height / 2;
		}
		
	}

}