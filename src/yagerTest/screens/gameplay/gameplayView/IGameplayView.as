package yagerTest.screens.gameplay.gameplayView 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	import yagerTest.model.GridModel;
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * Main gameplay view class interface
	 * @author gbiskup
	 */
	public interface IGameplayView extends IViewComponent
	{
		/**
		 * Dispatches move requests when user clicks on free tile. Target grid position as a parameter.
		 */
		function get moveRequestSignal():Signal;
		
		/**
		 * Requests game actions defined in GameplayAction class.
		 */
		function get gameActionRequestSignal():Signal;
		
		/**
		 * Signal dispatched on every time change (every frame). Calls listeners with no parameters.
		 */
		function get timeUpdatedSignal():Signal;
		
		/**
		 * Move player through all grid waypoints from the given vector with constant speed.
		 */
		function movePlayer(path:Vector.<Point>):void;
		
		function getPlayerGridPosition():Point;
		
		/**
		 * Draws all game objects from the grid. Optionally only draws objects with type present in filter array.
		 */
		function showGrid(grid:GridModel, filters:Array = null):void;
		
		function startTime(timeLimit:Number):void;
		
		function pause():void;
		
		function resume():void;

		function removeAllCoins():void;
		
		function removeCoin(gridPosition:Point):void;
		
		/**
		 * Schedules next coins respawn request in coinstRespawnTime seconds.
		 */
		function setCoinsRespawnTime(coinsRespawnTime:Number, removeAfter:Number):void 
		
		/**
		 * Returns seconds of gameplay since the game started.
		 */
		function getElapsedSeconds():Number;
	}
	
}
