package screens.mainMenu 
{
	import com.sibirjak.asdpc.button.Button;
	import screens.BasicScreen;
	import factories.uiComponents.ButtonFactory;
	import view.uiComponents.MyVerticalMenu;
	import factories.uiComponents.MenuFactory;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MainMenuScreen extends BasicScreen 
	{
		private var menu:MyVerticalMenu;
		
		public function MainMenuScreen() 
		{
			super();
		}
		
		override protected function init():void
		{
			initMenu();
		}
		
		private function initMenu():void
		{
			menu = MenuFactory.craeteVerticalMenu();
			menu.addButton(ButtonFactory.createTextButton("Play", onPlayButton));
			menu.addButton(ButtonFactory.createTextButton("Credits", onCreditsButton));
			addChild(menu);
			menu.x = stage.stageWidth / 2 - menu.width / 2;
			menu.y = stage.stageHeight / 2 - menu.height / 2;
		}
		
		private function onPlayButton():void
		{
			trace("Play");
		}
		
		private function onCreditsButton():void
		{
			trace("Credits");
		}
		
	}

}