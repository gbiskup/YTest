package yagerTest.screens.gameplay 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayScreen 
	{
		function get userActionSignal():Signal;
		
		function initGrid(width:int, height:int):void;
		
		function start(timeLimit:Number):void;
	}
	
}