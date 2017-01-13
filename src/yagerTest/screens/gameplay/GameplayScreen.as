package yagerTest.screens.gameplay 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import yagerTest.factories.gameObjects.ActorsFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.gridComponent.GridComponent;
	import yagerTest.screens.gameplay.gridComponent.GridPositionHelper;
	import yagerTest.view.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreen extends BasicScreen implements IGameplayScreen
	{
		public static const GRID_CELL_SIZE:Number = 25.0;
		
		private var gridContainer:GridComponent;
		
		/* INTERFACE yagerTest.screens.gameplay.IGameplayScreen */

		public function initGrid(width:int, height:int):void
		{
			gridContainer = new GridComponent(width, height, GRID_CELL_SIZE);
			addChild(gridContainer);
		}
		
		override protected function init():void
		{
			super.init();
			AlignDisplayObject.center(gridContainer, getBounds(this))
		}
		
		public function addObstacleAtGridPosition(x:uint, y:uint, type:int):void
		{
			if (type == GameObjectTypes.COIN)
			{
				var obstacle:Sprite = ActorsFactory.createAvatar(0xf4d742, GRID_CELL_SIZE / 2.0);
				var position:Point = GridPositionHelper.gridToPixelPosition(new Point(x, y), GRID_CELL_SIZE, GRID_CELL_SIZE);
				obstacle.x = position.x;
				obstacle.y = position.y;
				gridContainer.addChild(obstacle);
			}
		}
		
	}

}