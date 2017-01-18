package 
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import yagerTest.screens.gameplay.GameplayScreenMediator;
	import yagerTest.screens.gameplay.IGameplayScreen;
	import yagerTest.screens.gameplay.gameplayView.GameplayMediator;
	import yagerTest.screens.gameplay.gameplayView.IGameplayView;
	import yagerTest.screens.gameplay.hud.HudMediator;
	import yagerTest.screens.gameplay.hud.IHudView;
	import yagerTest.screens.mainMenu.IMainMenuScreen;
	import yagerTest.screens.mainMenu.MainMenuScreenMediator;
	
	/**
	 * Robot legs config class. Registers mediators to some of views.
	 * @author gbiskup
	 */
	public class ApplicationConfig implements IConfig 
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure():void
		{
			mediatorMap.map(IMainMenuScreen).toMediator(MainMenuScreenMediator);
			mediatorMap.map(IGameplayScreen).toMediator(GameplayScreenMediator);
			mediatorMap.map(IGameplayView).toMediator(GameplayMediator);
			mediatorMap.map(IHudView).toMediator(HudMediator);
		}
		
	}

}
