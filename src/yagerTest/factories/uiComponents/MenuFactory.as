package yagerTest.factories.uiComponents 
{
	import flash.geom.Point;
	import yagerTest.view.uiComponents.menu.MyVerticalMenu;
	import com.sibirjak.asdpcbeta.layout.VLayout;
	import com.sibirjak.asdpc.core.constants.Position;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MenuFactory 
	{
		public static const defaultPadding:Point = new Point(20, 20);
		
		public static function craeteVerticalMenu():MyVerticalMenu 
		{
			var menu:MyVerticalMenu = new MyVerticalMenu();
			menu.setStyle(VLayout.style.horizontalAlign, Position.CENTER);
			menu.setStyle(VLayout.style.itemPadding, defaultPadding.y);
			return menu;
		}
		
	}

}