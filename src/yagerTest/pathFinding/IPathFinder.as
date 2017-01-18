package yagerTest.pathFinding 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IPathFinder 
	{
		function findPathWaypoints(startPoint:Point, endPoint:Point):Vector.<Point>;
	}
	
}