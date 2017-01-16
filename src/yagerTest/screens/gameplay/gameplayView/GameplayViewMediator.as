package yagerTest.screens.gameplay.gameplayView 
{
	import flash.geom.Point;
	import robotlegs.bender.bundles.mvcs.Mediator;
	import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
	import robotlegs.bender.extensions.directCommandMap.api.IDirectCommandMap;
	import yagerTest.commands.gameplay.SpawnObjectsCommand;
	import yagerTest.commands.gameplay.SpawnObjectsPayload;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GameplayModel;
	import yagerTest.view.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayViewMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayView;
		
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var commandMap:IDirectCommandMap;
		
		override public function initialize():void
		{
			super.initialize();
			view.initializedSignal.add(onViewInitialized);
		}
		
		private function onViewInitialized(viewComponent:IViewComponent):void
		{
			view.initializedSignal.remove(onViewInitialized);
			view.showGrid(gameplayModel.grid);
			view.moveRequestSignal.add(onMoveRequest);
			view.gameActionRequestSignal.add(onGameplayActionRequest);
			gameplayModel.grid.gridUpdatedSignal.add(onGridUpdated);
		}
		
		private function onGridUpdated(objectType:int):void
		{
			if (objectType == GameObjectTypes.COIN)
			{
				view.removeAllCoins();
				view.setCoinsRespawnTime(GameplayConstants.COINS_RESPAWN_TIME);
			}
			view.showGrid(gameplayModel.grid, [objectType]);
		}
		
		override public function destroy():void
		{
			gameplayModel.grid.gridUpdatedSignal.remove(onGridUpdated);
			view.moveRequestSignal.remove(onMoveRequest);
			view.gameActionRequestSignal.remove(onGameplayActionRequest);
			super.destroy();
		}
		
		private function onGameplayActionRequest(action:String):void
		{
			if (action == GameplayActions.SPAWN_COINS)
			{
				gameplayModel.grid.replaceTypes(GameObjectTypes.COIN, GameObjectTypes.EMPTY);
				var spawnPayload:SpawnObjectsPayload = new SpawnObjectsPayload(GameObjectTypes.COIN, new Vector.<Point>(GameplayConstants.COINS_LIMIT));
				commandMap.map(SpawnObjectsCommand).execute(new CommandPayload([spawnPayload], [SpawnObjectsPayload]));
			}
		}
		
		private function onMoveRequest(start:Point, destination:Point):void
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