package yagerTest.screens.gameplay 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.commands.gameplay.ExitGameMacro;
	import yagerTest.commands.gameplay.StartGameMacro;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GameplayModel;
	import yagerTest.model.GridModel;
	import yagerTest.screens.mainMenu.UserActions;
	import yagerTest.view.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayScreen;
		
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var injector:IInjector;
		
		override public function initialize():void
		{
			super.initialize();
			view.userActionSignal.add(onUserAction);
			view.initializedSignal.add(onViewInitialized);
		}
		
		override public function destroy():void
		{
			view.userActionSignal.remove(onUserAction);
			super.destroy();
		}
		
		private function onUserAction(actionType:String):void
		{
			switch(actionType)
			{
				case UserActions.EXIT_GAME:
					var exitGameMacro:ExitGameMacro = injector.instantiateUnmapped(ExitGameMacro);
					exitGameMacro.execute();
					break;
					
				case UserActions.RESTART_GAME:
					var startGameMacro:StartGameMacro = injector.instantiateUnmapped(StartGameMacro);
					startGameMacro.execute();
					break;
			}
		}
		
		private function onViewInitialized(viewComponent:IViewComponent):void
		{
			viewComponent.initializedSignal.remove(onViewInitialized);
			view.initGameplay(gameplayModel);
			//gameplayModel.timeUpdatedSignal;
			//gameplayModel.scoreUpdatedSignal;
		}
	
	}

}