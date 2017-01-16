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
		function movePlayer(path:Vector.<Point>):void;
		function pause():void;
		function resume():void;
	
		function showGrid(grid:GridModel, filters:Array = null):void;
	}
	
}