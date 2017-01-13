package yagerTest.screens.gameplay 
{
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IGameplayScreen 
	{
		function addObstacleAtGridPosition(x:uint, y:uint, objectTypeAt:int):void;
		
		function initGrid(width:int, height:int):void;
	}
	
}