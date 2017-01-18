package yagerTest.model 
{
	import flash.geom.Point;
	
	/**
	 * Two dimmensional container for integer types.
	 * @author gbiskup
	 */
	public class GridModel
	{
		private var _size:Size;
		private var objectTypes:Vector.<int>;
		
		public function GridModel(size:Size)
		{
			_size = size.clone();
			objectTypes = new Vector.<int>(size.width * size.height);
		}
		
		private function positionToIndex(x:uint, y:uint):uint
		{
			return width * y + x;
		}
		
		public function setObjectTypeAt(x:uint, y:uint, objectType:int):void
		{
			objectTypes[positionToIndex(x, y)] = objectType;
		}
		
		public function getObjectTypeAt(x:uint, y:uint):int
		{
			return objectTypes[positionToIndex(x, y)];
		}
		
		public function get size():Size
		{
			return _size.clone();
		}
		
		public function get width():uint 
		{
			return size.width;
		}
		
		public function get height():uint 
		{
			return size.height;
		}
		
		/**
		 * Returns a new random point withing grid or updates given point reference if provided.
		 */
		public function getRandomCooridnates(targetPoint:Point = null):Point
		{
			if (!targetPoint)
			{
				targetPoint = new Point();
			}
			targetPoint.x = int(Math.random() * width);
			targetPoint.y = int(Math.random() * height);
			return targetPoint;
		}
		
		/**
		 * Replaces all cells of given type with another type.
		 */
		public function replaceTypes(typeToReplace:int, replaceWith:int):void
		{
			for (var i:int = 0; i < objectTypes.length; i++)
			{
				if (objectTypes[i] == typeToReplace)
				{
					objectTypes[i] = replaceWith;
				}
			}
		}
		
	}
}