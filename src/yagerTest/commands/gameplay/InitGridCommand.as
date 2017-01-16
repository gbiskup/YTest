package yagerTest.commands.gameplay 
{
	import flash.geom.Point;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GameplayModel;
	import yagerTest.model.GridModel;
	import yagerTest.model.GameObjectTypes;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGridCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		public function execute():void 
		{
			if (injector.hasMapping(GameplayModel))
			{
				gameplayModel = injector.getInstance(GameplayModel);
			}
			else
			{
				var gameplayModel:GameplayModel = new GameplayModel();
				injector.map(GameplayModel).toValue(gameplayModel);
			}
			
			var gridModel:GridModel = new GridModel(GameplayConstants.GRID_SIZE);
			
			var objectPosition:Point = GameplayConstants.GRID_SIZE.clone();
			objectPosition.x /= 2;
			objectPosition.y /= 2;
			
			gridModel.setObjectTypeAt(objectPosition.x, objectPosition.y, GameObjectTypes.PLAYER);
			
			var obstaclesNumber:int = 128;
			while(obstaclesNumber > 0)
			{
				gridModel.getRandomCooridnates(objectPosition);
				if (gridModel.getObjectTypeAt(objectPosition.x, objectPosition.y) == GameObjectTypes.EMPTY)
				{
					gridModel.setObjectTypeAt(objectPosition.x, objectPosition.y, GameObjectTypes.OBSTACLE);
					obstaclesNumber--;
				}
			}
			
			var coinsNumber:int = 3;
			while (coinsNumber > 0)
			{
				if (gridModel.getObjectTypeAt(objectPosition.x, objectPosition.y) == GameObjectTypes.EMPTY)
				{
					gridModel.setObjectTypeAt(objectPosition.x, objectPosition.y, GameObjectTypes.COIN);
					coinsNumber--;
				}
				gridModel.getRandomCooridnates(objectPosition);
			}
			
			gameplayModel.setScore(0);
			gameplayModel.setTimeLimit(GameplayConstants.TIME_LIMIT);
			gameplayModel.setGrid(gridModel);
		}
		
	}

}