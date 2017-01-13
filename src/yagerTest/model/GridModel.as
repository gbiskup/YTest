package yagerTest.model 
{
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridModel 
	{
		private var _width:uint;
		private var _height:uint;
		
		private var grid:Vector.<int>;
		
		public function GridModel(width:uint = 32, height:uint = 32) 
		{
			_width = width;
			_height = height;
			grid = new Vector.<int>(_width * _height);
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
		
		public function get width():uint 
		{
			return _width;
		}
		
		public function get height():uint 
		{
			return _height;
		}
		
	}

}