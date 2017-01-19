package yagerTest.commands 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.screens.ScreenManager;
	import yagerTest.screens.intro.IntroAuthorScreen;
	import yagerTest.screens.intro.IntroLogoScreen;
	import yagerTest.screens.mainMenu.MainMenuScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGameScreensCommand implements ICommand
	{
		[Inject]
		public var screenManager:ScreenManager;
		
		public function execute():void
		{
			screenManager.addScreen(IntroAuthorScreen);
			screenManager.addScreen(IntroLogoScreen);
			screenManager.addScreen(MainMenuScreen);
			screenManager.showNextScreen();
		}
	}
}
