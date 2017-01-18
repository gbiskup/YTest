package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.model.GridModel;
	import yagerTest.view.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayView extends IViewComponent
	{
		function get moveRequestSignal():Signal;
		function get gameActionRequestSignal():Signal;
		function get timeUpdatedSignal():Signal;
		function getPlayerGridPosition():Point;
		function movePlayer(path:Vector.<Point>):void;
		function pause():void;
		function resume():void;
	
		function showGrid(grid:GridModel, filters:Array = null):void;
		function startTime(timeLimit:Number):void;
		
		function removeAllCoins():void;
		function removeCoin(gridPosition:Point):void;
		
		function setCoinsRespawnTime(coinsRespawnTime:Number):void;
		
		function getElapsedSeconds():Number;
		
	}
	
}