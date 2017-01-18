package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GameplayModel;
	import yagerTest.pathFinding.IPathFinder;
	import yagerTest.pathFinding.Pathfinder;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitPathFinderCommand implements ICommand
	{
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var injector:IInjector;
		
		public function execute():void
		{
			if (!injector.hasMapping(IPathFinder))
			{
				var pathFinder:Pathfinder = new Pathfinder();
				injector.map(IPathFinder).toValue(pathFinder);
			}
			else
			{
				pathFinder = injector.getInstance(IPathFinder) as Pathfinder;
			}
			pathFinder.loadGrid(gameplayModel.grid);
		}
		
	}

}