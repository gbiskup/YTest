package yagerTest.commands.gameplay 
{
	import flash.geom.Point;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GameplayModel;
	import yagerTest.model.GridModel;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGameplayModelCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		public function execute():void 
		{
			if (injector.hasMapping(GameplayModel))
			{
				gameplayModel = injector.getInstance(GameplayModel);
				gameplayModel.reset();
			}
			else
			{
				var gameplayModel:GameplayModel = new GameplayModel();
				injector.map(GameplayModel).toValue(gameplayModel);
			}
			
			gameplayModel.setScore(0);
			gameplayModel.setTimeLimit(GameplayConstants.TIME_LIMIT);
			gameplayModel.setGrid(new GridModel(GameplayConstants.GRID_SIZE));
			gameplayModel.setPlayerPosition(new Point(GameplayConstants.GRID_SIZE.width / 2, GameplayConstants.GRID_SIZE.height / 2));
		}
		
	}

}
