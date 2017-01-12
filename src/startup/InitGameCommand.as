package startup 
{
	import robotlegs.bender.bundles.mvcs.Command;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IContext;
	import screens.ScreenManager;
	import screens.splash.IntroAuthorScreen;
	import screens.splash.IntroLogoScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGameCommand implements ICommand
	{
		[Inject]
		public var screenManager:ScreenManager;
		
		public function execute():void
		{
			screenManager.addScreen(new IntroAuthorScreen());
			screenManager.addScreen(new IntroLogoScreen());
			screenManager.showNextScreen();
		}
	}
}