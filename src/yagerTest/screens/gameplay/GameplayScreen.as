package yagerTest.screens.gameplay 
{
	import flash.display.Sprite;
	import yagerTest.factories.gameObjects.ActorsFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.gridComponent.GridComponent;
	import yagerTest.view.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreen extends BasicScreen implements IGameplayScreen
	{
		public static const GRID_CELL_SIZE:Number = 20.0;
		
		private var gridContainer:GridComponent;
		
		/* INTERFACE yagerTest.screens.gameplay.IGameplayScreen */

		public function initGrid(width:int, height:int):void
		{
			gridContainer = new GridComponent(width, height, GRID_CELL_SIZE);
			addChild(gridContainer);
			AlignDisplayObject.center(gridContainer, getBounds(this));
		}
		
		public function addObstacleAtGridPosition(x:uint, y:uint, type:int):void
		{
			if (type == GameObjectTypes.COIN)
			{
				var obstacle:Sprite = ActorsFactory.createAvatar(0xf4d742, GRID_CELL_SIZE / 2.0);
				obstacle.x = x * GRID_CELL_SIZE;
				obstacle.y = y * GRID_CELL_SIZE;
				addChild(obstacle);
			}
		}
		
	}

}