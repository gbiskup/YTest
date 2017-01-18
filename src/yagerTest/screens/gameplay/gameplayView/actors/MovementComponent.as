package yagerTest.screens.gameplay.gameplayView.actors 
{
	import com.gskinner.motion.GTween;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	
	/**
	 * Handles movement on a 2D grid
	 * @author gbiskup
	 */
	public class MovementComponent 
	{
		// Object to move
		private var target:DisplayObject;
		
		private var currentPath:Vector.<Point>;
		private var gridCellSize:Point;
		private var speed:Number;
		
		private var moveTween:GTween;
		
		/**
		 * @param target Target object to move
		 * @param gridCellSize Size of a single cell size in pixels
		 * @param pixelsPerSecond Movement speed
		 */
		public function MovementComponent(target:DisplayObject, gridCellSize:Point, pixelsPerSecond:Number) 
		{
			this.target = target;
			this.gridCellSize = gridCellSize;
			this.speed = pixelsPerSecond;
			moveTween = new GTween(target);
		}
		
		/**
		 * Moves target object through grid cells at positions given in the vector.
		 */
		public function followPath(path:Vector.<Point>):void
		{
			if (path)
			{
				currentPath = path;
				moveToNextPoint();
			}
		}
		
		public function pause():void 
		{
			moveTween.paused = true;
		}
		
		public function resume():void
		{
			moveTween.paused = false;
		}
		
		private function moveToNextPoint():void
		{
			moveToPoint(currentPath.shift());
		}
		
		private function moveToPoint(gridPosition:Point):void
		{
			if (gridPosition)
			{
				var pixelPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, gridCellSize);
				moveTween.setValues({x:pixelPosition.x, y:pixelPosition.y});				
				// Calculate transition vector
				pixelPosition.x -= target.x;
				pixelPosition.y -= target.y;
				moveTween.duration = pixelPosition.length/speed;
				moveTween.onComplete = onMoveTweenComplete;
			}
		}
		
		private function onMoveTweenComplete(tween:GTween):void
		{
			moveToNextPoint();
		}
		
	}

}
