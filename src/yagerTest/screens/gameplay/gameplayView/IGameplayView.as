package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayView 
	{
		function get moveRequestSignal():Signal;
		function movePlayer(path:Vector.<Point>):void;
		function pause():void;
		function resume():void;
		
		function addCoin(gridPosition:Point):void;
	}
	
}