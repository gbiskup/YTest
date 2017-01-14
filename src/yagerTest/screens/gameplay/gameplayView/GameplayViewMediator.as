package yagerTest.screens.gameplay.gameplayView 
{
	import com.sibirjak.asdpc.core.constants.Position;
	import flash.geom.Point;
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayViewMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayView;
		
		override public function initialize():void
		{
			super.initialize();
			view.moveRequestSignal.add(onMoveRequestSignal);
		}
		
		private function onMoveRequestSignal(start:Point, destination:Point):void
		{
			var path:Vector.<Point> = new Vector.<Point>();
			var moveVector:Point = destination.subtract(start);
			var direction:int = moveVector.x > 0 ? 1 : -1;
			var wayPoint:Point = start.clone();
			
			var lenght:int = Math.abs(moveVector.x);
			
			for (var x:int = 1; x <= lenght; x++)
			{
				wayPoint.x = start.x + x * direction;
				path.push(wayPoint.clone());
			}
			lenght = Math.abs(moveVector.y);
			direction = moveVector.y > 0 ? 1 : -1;
			for (var y:int = 1; y <= lenght; y++)
			{
				wayPoint.y = start.y + direction * y;
				path.push(wayPoint.clone());
			}
			view.movePlayer(path);
		}
	}

}