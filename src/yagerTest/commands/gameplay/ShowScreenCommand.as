package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.ScreenManager;
	import yagerTest.screens.gameplay.GameplayScreen;
	import yagerTest.screens.mainMenu.MainMenuScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ShowScreenCommand implements ICommand 
	{
		[Inject]
		public var screenManager:ScreenManager;
		
		[Inject]
		public var screen:BasicScreen;
		
		public function execute():void 
		{
			screenManager.addScreen(screen);
			screenManager.showNextScreen();
		}
		
	}

}