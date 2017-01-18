package yagerTest.view.utilities 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.view.utilities.AlignAnchors;
	
	/**
	 * Helper class providing static functions to align display objects.
	 * @author gbiskup
	 */
	public class AlignDisplayObject
	{
		/**
		 * Aligns center of a given display object with the center of given bounds.
		 */
		public static function center(displayObject:DisplayObject, bounds:Rectangle):void
		{
			align(displayObject, AlignAnchors.CENTER, bounds, AlignAnchors.CENTER);
		}
		
		/**
		 * Aligns display object's right bottom with the right bottom of given bounds. Optionally adds offset point.
		 */
		static public function rightBottom(displayObject:DisplayObject, bounds:Rectangle, offset:Point = null):void 
		{
			align(displayObject, AlignAnchors.RIGHT_BOTTOM, bounds, AlignAnchors.RIGHT_BOTTOM, offset);
		}
		
		/**
		 * Aligns display object's right top with the right top of given bounds. Optionally adds offset point.
		 */
		static public function rightTop(displayObject:DisplayObject, bounds:Rectangle, offset:Point = null):void 
		{
			align(displayObject, AlignAnchors.RIGHT_TOP, bounds, AlignAnchors.RIGHT_TOP, offset);
		}
		
		/**
		 * Sets display object's position to a point returned by custom align function called with given args.
		 */
		static public function customAlign(displayObject:DisplayObject, alignFunction:Function, ... args):void
		{
			var pixelPosition:Point = alignFunction.apply(null, args);
			displayObject.x = pixelPosition.x;
			displayObject.y = pixelPosition.y;
		}
		
		/**
		 * Aligns display object's anchor point with anchor point in given bounds. Use AlignAnchors class for commonly used anchors or a custom point with normalized (0.0 - 1.0)
		 * coordinates. Optionally adds offset to final position.
		 */
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
		
	}

}
