package yagerTest.commands 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.ScreenManager;
	
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
