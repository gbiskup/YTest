package yagerTest.screens.gameplay 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayScreen 
	{
		function get userActionSignal():Signal;
		
		function initGrid(gridSize:Point, cellSize:Point):void;
		
		function start(timeLimit:Number):void;
	}
	
}