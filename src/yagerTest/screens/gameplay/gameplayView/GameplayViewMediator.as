package yagerTest.screens.gameplay.gameplayView 
{
	import com.sibirjak.asdpc.core.constants.Position;
	import flash.geom.Point;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayViewMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayView;
		
		override public function initialize():void
		{
			super.initialize();
			view.selectDestinationSignal.add(onSelectDestinationSignal);
		}
		
		private function onSelectDestinationSignal(gridPosition:Point):void
		{
			view.movePlayer(new <Point>[gridPosition]);
		}
	}

}