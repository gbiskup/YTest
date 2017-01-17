package yagerTest.screens.gameplay.gameplayView.actors 
{
	import com.gskinner.motion.GTween;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MovementComponent 
	{
		private var target:DisplayObject;
		
		private var currentPath:Vector.<Point>;
		private var girdCellSize:Point;
		private var speed:Number;
		
		private var moveTween:GTween;
		
		public function MovementComponent(target:DisplayObject, gridCellSize:Point, pixelsPerSecond:Number) 
		{
			this.target = target;
			this.girdCellSize = gridCellSize;
			this.speed = pixelsPerSecond;
			moveTween = new GTween(target);
		}
		
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
				var pixelPosition:Point = GridPositionHelper.gridToPixelPosition(gridPosition, girdCellSize);
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