package 
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GameplayModel;
	import yagerTest.screens.gameplay.GameplayScreenMediator;
	import yagerTest.screens.gameplay.IGameplayScreen;
	import yagerTest.screens.gameplay.gameplayView.GameplayViewMediator;
	import yagerTest.screens.gameplay.gameplayView.IGameplayView;
	import yagerTest.screens.mainMenu.IMainMenuScreen;
	import yagerTest.screens.mainMenu.MainMenuScreenMediator;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class YagerConfig implements IConfig 
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure():void
		{
			mediatorMap.map(IMainMenuScreen).toMediator(MainMenuScreenMediator);
			mediatorMap.map(IGameplayScreen).toMediator(GameplayScreenMediator);
			mediatorMap.map(IGameplayView).toMediator(GameplayViewMediator);
		}
	}

}