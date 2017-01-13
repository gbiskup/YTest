package yagerTest.commands 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.screens.ScreenManager;
	import yagerTest.screens.credits.CreditsScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ShowCreditsCommand implements ICommand 
	{
		[Inject]
		public var screenManager:ScreenManager;
		
		public function execute():void 
		{
			screenManager.addScreen(new CreditsScreen());
			screenManager.showNextScreen();
		}
		
	}

}