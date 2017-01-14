package yagerTest.screens.gameplay.gameplayView 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayView 
	{
		function get selectDestinationSignal():Signal;
		function movePlayer(path:Vector.<Point>):void;
	}
	
}