package yagerTest.model 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GridModel 
	{
		private var _gridUpdatedSignal:Signal = new Signal();
		
		private var _size:Point;
		private var objectTypes:Vector.<int>;
		
		public function GridModel(size:Point)
		{
			_size = size;
			objectTypes = new Vector.<int>(size.x * size.y);
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
		
		public function get gridUpdatedSignal():Signal 
		{
			return _gridUpdatedSignal;
		}
		
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