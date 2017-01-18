package yagerTest.screens.mainMenu 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import yagerTest.commands.ShowCreditsCommand;
	import yagerTest.commands.gameplay.StartGameMacro;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MainMenuScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IMainMenuScreen;
		
		[Inject]
		public var commandMap:IDirectCommandMap;
		
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
				case UserActions.START_GAME:
					commandMap.map(StartGameMacro).execute();
					break;
				
				case UserActions.SHOW_CREDITS:
					commandMap.map(ShowCreditsCommand).execute();
					break;
			}
		}
		
	}

}
