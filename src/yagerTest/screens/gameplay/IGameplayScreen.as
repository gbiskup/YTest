package yagerTest.screens.gameplay 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.model.GameplayModel;
	import yagerTest.view.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayScreen extends IViewComponent
	{
		function get userActionSignal():Signal;
		function initGameplay(gameplayModel:GameplayModel):void;
	}
	
}