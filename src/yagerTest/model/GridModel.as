package yagerTest.model 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridModel 
	{
		private var _size:Point;
		private var grid:Vector.<int>;
		
		public function GridModel(size:Point)
		{
			_size = size;
			grid = new Vector.<int>(size.x * size.y);
		}
		
		private function positionToIndex(x:uint, y:uint):uint
		{
			return width * y + x;
		}
		
		public function setObjectTypeAt(x:uint, y:uint, objectType:int):void
		{
			grid[positionToIndex(x, y)] = objectType;
		}
		
		public function getObjectTypeAt(x:uint, y:uint):int
		{
			return grid[positionToIndex(x, y)];
		}
		
		public function get size():Point
		{
			return _size.clone();
		}
		
		public function get width():uint 
		{
			return size.x;
		}
		
		public function get height():uint 
		{
			return size.y;
		}
		
	}

}