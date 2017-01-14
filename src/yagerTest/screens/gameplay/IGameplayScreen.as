package yagerTest.screens.gameplay 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayScreen 
	{
		function addObstacleAtGridPosition(x:uint, y:uint, objectTypeAt:int):void;
		
		function initGrid(width:int, height:int):void;
		
		function get togglePauseSignal():Signal;
	}
	
}