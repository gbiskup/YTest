package yagerTest.commands.gameplay 
{
	import flash.geom.Point;
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayModel;
	import yagerTest.model.GridModel;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class SpawnObjectsCommand implements ICommand 
	{
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var spawnObject:SpawnObjectsPayload;
		
		public function execute():void 
		{
			var objectPosition:Point;
			var gridModel:GridModel = gameplayModel.grid;
			for (var i:int = 0; i < spawnObject.positions.length; i++)
			{
				objectPosition = spawnObject.positions[i];
				if (!objectPosition)
				{
					objectPosition = findRandomEmptyPosition(gameplayModel.grid);
				}
				gridModel.setObjectTypeAt(objectPosition.x, objectPosition.y, spawnObject.type);
			}
			gameplayModel.gridUpdatedSignal.dispatch(spawnObject.type);
		}
		
		private function findRandomEmptyPosition(gridModel:GridModel):Point
		{
			do
			{
				var randomPosition:Point = gridModel.getRandomCooridnates();
			} 
			while (gridModel.getObjectTypeAt(randomPosition.x, randomPosition.y) != GameObjectTypes.EMPTY);
			return randomPosition;
		}
		
	}

}