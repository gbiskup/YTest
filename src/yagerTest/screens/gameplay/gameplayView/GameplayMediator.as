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
	import yagerTest.pathFinding.IPathFinder;
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayMediator extends Mediator 
	{
		[Inject]
		public var view:IGameplayView;
		
		[Inject]
		public var gameplayModel:GameplayModel;
		
		[Inject]
		public var commandMap:IDirectCommandMap;
		
		[Inject]
		public var pathFinder:IPathFinder;
		
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
			view.timeUpdatedSignal.add(onTimeUpdate);
			view.gameActionRequestSignal.add(onGameplayActionRequest);
			gameplayModel.objectsSpawnedSignal.add(onObjectsSpawned);
		}
		
		private function onObjectsSpawned(objectType:int):void
		{
			if (objectType == GameObjectTypes.COIN)
			{
				view.removeAllCoins();
				view.showGrid(gameplayModel.grid, [GameObjectTypes.COIN]);
				view.setCoinsRespawnTime(GameplayConstants.COINS_RESPAWN_TIME, GameplayConstants.COINS_REMOVE_TIME);
			}
		}
		
		private function onTimeUpdate():void
		{
			var playerPosition:Point = view.getPlayerGridPosition();
			// Check if there is a coin at player's position
			if (gameplayModel.grid.getObjectTypeAt(playerPosition.x, playerPosition.y) == GameObjectTypes.COIN)
			{
				//Pick a coin
				gameplayModel.setScore(gameplayModel.score + 1);
				view.removeCoin(playerPosition);
			}
			gameplayModel.setPlayerPosition(view.getPlayerGridPosition());
			gameplayModel.setTimeLeft(gameplayModel.timeLimit - view.getElapsedSeconds());
		}
		
		override public function destroy():void
		{
			gameplayModel.objectsSpawnedSignal.remove(onObjectsSpawned);
			view.moveRequestSignal.remove(onMoveRequest);
			view.gameActionRequestSignal.remove(onGameplayActionRequest);
			super.destroy();
		}
		
		private function onGameplayActionRequest(action:String):void
		{
			if (action == GameplayActions.SPAWN_COINS)
			{
				gameplayModel.grid.replaceTypes(GameObjectTypes.COIN, GameObjectTypes.EMPTY);
				var spawnPayload:SpawnObjectsPayload = new SpawnObjectsPayload(GameObjectTypes.COIN, GameplayConstants.COINS_LIMIT);
				commandMap.map(SpawnObjectsCommand).execute(new CommandPayload([spawnPayload], [SpawnObjectsPayload]));
			}
			else if (action == GameplayActions.REMOVE_COINS)
			{
				gameplayModel.grid.replaceTypes(GameObjectTypes.COIN, GameObjectTypes.EMPTY);
				view.removeAllCoins();
			}
		}
		
		private function onMoveRequest(destination:Point):void
		{
			if (!destination.equals(gameplayModel.playerPosition))
			{
				var waypoints:Vector.<Point> = pathFinder.findPathWaypoints(view.getPlayerGridPosition(), destination);
				view.movePlayer(waypoints);
			}
		}
	}

}
