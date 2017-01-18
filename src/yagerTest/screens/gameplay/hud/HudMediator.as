package yagerTest.screens.gameplay.hud 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import yagerTest.model.GameplayModel;
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class HudMediator extends Mediator
	{
		[Inject]
		public var view:IHudView;

		[Inject]
		public var gameplayModel:GameplayModel;
		
		override public function initialize():void
		{
			super.initialize();
			view.initializedSignal.add(onViewInitialized);
		}
		
		private function onViewInitialized(initializedView:IViewComponent):void
		{
			view.showScore(gameplayModel.score);
			view.showScore(gameplayModel.timeLeft);
			initializedView.initializedSignal.remove(onViewInitialized);
			gameplayModel.timeUpdated.add(view.showTime);
			gameplayModel.scoreUpdated.add(view.showScore);
		}
		
		override public function destroy():void
		{
			gameplayModel.timeUpdated.remove(view.showTime);
			gameplayModel.scoreUpdated.remove(view.showScore);
			view.initializedSignal.remove(onViewInitialized);
			super.destroy();
		}
		
	}

}