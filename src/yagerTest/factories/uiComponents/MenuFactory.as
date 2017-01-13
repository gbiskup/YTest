package yagerTest.factories.uiComponents 
{
	import yagerTest.view.uiComponents.MyVerticalMenu;
	import com.sibirjak.asdpcbeta.layout.VLayout;
	import com.sibirjak.asdpc.core.constants.Position;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MenuFactory 
	{
		
		public static function craeteVerticalMenu():MyVerticalMenu 
		{
			var menu:MyVerticalMenu = new MyVerticalMenu();
			menu.setStyle(VLayout.style.horizontalAlign, Position.CENTER);
			menu.setStyle(VLayout.style.itemPadding, 20.0);
			return menu;
		}
		
	}

}