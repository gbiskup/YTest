package yagerTest.view 
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import yagerTest.view.uiComponents.MyButton;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class AlignDisplayObject 
	{
		public static function center(displayObject:DisplayObject, bounds:Rectangle):void
		{
			displayObject.x = bounds.width / 2 - displayObject.width / 2;
			displayObject.y = bounds.height / 2 - displayObject.height / 2;
		}
		
		static public function rightBottom(displayObject:DisplayObject, bounds:Rectangle):void 
		{
			displayObject.x = bounds.width - displayObject.width;
			displayObject.y = bounds.height - displayObject.height;
		}
		
	}

}