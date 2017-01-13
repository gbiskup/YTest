package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.screens.ScreenManager;
	import yagerTest.screens.gameplay.GameplayScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGameScreenCommand implements ICommand 
	{
		[Inject]
		public var screenManager:ScreenManager;
		
		public function execute():void 
		{
			screenManager.addScreen(new GameplayScreen());
			screenManager.showNextScreen();
		}
		
	}

}