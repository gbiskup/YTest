package yagerTest.commands.startup 
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IContext;
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
			screenManager.addScreen(new IntroAuthorScreen());
			screenManager.addScreen(new IntroLogoScreen());
			screenManager.addScreen(new MainMenuScreen());
			screenManager.showNextScreen();
		}
	}
}