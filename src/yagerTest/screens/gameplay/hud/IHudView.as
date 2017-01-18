package yagerTest.screens.gameplay.hud 
{
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IHudView extends IViewComponent
	{
		function showTime(time:uint):void;
		function showScore(score:int):void;
	}
	
}