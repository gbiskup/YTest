package yagerTest.screens.gameplay 
{
	import robotlegs.bender.bundles.mvcs.Mediator;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreenMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayScreen;
		
		[Inject]
		public var gridModel:GridModel;
		
		override public function initialize():void
		{
			showGrid();
		}
		
		override public function destroy():void
		{
			super.destroy();
		}
		
		private function showGrid():void
		{
			view.initGrid(gridModel.width, gridModel.height);
			for (var y:uint = 0; y < gridModel.height; y++)
			{
				for (var x:uint = 0; x < gridModel.width; x++)
				{
					showTile(x, y);
				}
			}
		}
		
		private function showTile(x:uint, y:uint):void
		{
			view.addObstacleAtGridPosition(x, y, gridModel.getObjectTypeAt(x, y));	
		}
		
	}

}