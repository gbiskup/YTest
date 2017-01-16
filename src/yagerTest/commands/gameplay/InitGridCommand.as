package yagerTest.commands.gameplay 
{
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
				gridModel = injector.getInstance(GameplayModel);
			}
			else
			{
				var gameplayModel:GameplayModel = new GameplayModel();
				injector.map(GameplayModel).toValue(gameplayModel);
			}
			
			var gridModel:GridModel = new GridModel(GameplayConstants.GRID_SIZE);
			
			gridModel.setObjectTypeAt(0, 0, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(1, 1, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 6, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(15, 15, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(31, 31, GameObjectTypes.COIN);
			
			gameplayModel.setScore(0);
			gameplayModel.setTimeLimit(GameplayConstants.TIME_LIMIT);
			gameplayModel.setGrid(gridModel);
			
			/*gridModel.setObjectTypeAt(10, 10, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(10, 11, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(10, 12, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(23, 15, GameObjectTypes.OBSTACLE);*/
			
		}
		
	}

}