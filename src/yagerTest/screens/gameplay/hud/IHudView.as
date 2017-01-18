package yagerTest.screens.gameplay.hud 
{
	import yagerTest.view.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IHudView extends IViewComponent
	{
		function showTime(time:Number):void;
		function showScore(score:int):void;
	}
	
}