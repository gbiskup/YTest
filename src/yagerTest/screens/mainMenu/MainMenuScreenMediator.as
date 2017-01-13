package yagerTest.screens.mainMenu 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.screens.ScreenManager;
	import yagerTest.commands.StartGameCommand;
	import yagerTest.screens.credits.CreditsScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MainMenuScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IMainMenuScreen;
		
		[Inject]
		public var screenManager:ScreenManager;
		
		[Inject]
		public var injector:IInjector;
		
		public function MainMenuScreenMediator() 
		{
			super();
			
		}
		
		override public function initialize():void
		{
			super.initialize();
			view.userActionSignal.add(onUserActionRequest);
		}
		
		override public function destroy():void
		{
			view.userActionSignal.remove(onUserActionRequest);
			super.destroy();
		}
		
		private function onUserActionRequest(actionName:String):void
		{
			var command:ICommand;
			switch(actionName)
			{
				case MainMenuUserActions.START_GAME:
					command = injector.instantiateUnmapped(StartGameCommand);
					command.execute();
					break;
				
				case MainMenuUserActions.SHOW_CREDITS:
					screenManager.addScreen(new CreditsScreen());
					screenManager.showNextScreen();
					break;
			}
		}
		
	}

}