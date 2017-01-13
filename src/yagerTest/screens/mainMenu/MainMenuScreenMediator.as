package yagerTest.screens.mainMenu 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.commands.ShowCreditsCommand;
	import yagerTest.commands.gameplay.StartGameMacro;
	import yagerTest.screens.ScreenManager;
	import yagerTest.commands.gameplay.InitGameScreenCommand;
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
					command = injector.instantiateUnmapped(StartGameMacro);
					command.execute();
					break;
				
				case MainMenuUserActions.SHOW_CREDITS:
					command = injector.instantiateUnmapped(ShowCreditsCommand);
					command.execute();
					break;
			}
		}
		
	}

}