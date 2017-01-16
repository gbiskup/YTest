package yagerTest.view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class AlignDisplayObject 
	{
		public static function center(displayObject:DisplayObject, bounds:Rectangle):void
		{
			align(displayObject, AlignAnchors.CENTER, bounds, AlignAnchors.CENTER);
		}
		
		public static function align(displayObject:DisplayObject, anchor:Point, bounds:Rectangle, boundsAnchor:Point = null, offset:Point = null):void
		{
			displayObject.x = bounds.width * boundsAnchor.x - displayObject.width * anchor.x;
			displayObject.y = bounds.height * boundsAnchor.y - displayObject.height * anchor.y;
			if (offset)
			{
				displayObject.x += offset.x;
				displayObject.y += offset.y;
			}
		}
		
		static public function rightBottom(displayObject:DisplayObject, bounds:Rectangle, offset:Point = null):void 
		{
			align(displayObject, AlignAnchors.RIGHT_BOTTOM, bounds, AlignAnchors.RIGHT_BOTTOM, offset);
		}
		
		static public function rightTop(displayObject:DisplayObject, bounds:Rectangle, offset:Point = null):void 
		{
			align(displayObject, AlignAnchors.RIGHT_TOP, bounds, AlignAnchors.RIGHT_TOP, offset);
		}
	}

}