package yagerTest.commands.gameplay 
{
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	import eu.alebianco.robotlegs.utils.impl.SubCommandPayload;
	import flash.geom.Point;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.GameplayScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class StartGameMacro extends SequenceMacro 
	{	
		override public function prepare():void
		{
			add(InitGridCommand);
			add(SpawnObjectsCommand).withPayloads(createRandomSpawnPayload(GameObjectTypes.OBSTACLE, GameplayConstants.OBSTACLES_LIMIT));
			add(SpawnObjectsCommand).withPayloads(createRandomSpawnPayload(GameObjectTypes.COIN, GameplayConstants.COINS_LIMIT));
			
			add(ShowScreenCommand).withPayloads(
				new SubCommandPayload(new GameplayScreen(), BasicScreen)
			);
		}
		
		private function createRandomSpawnPayload(type:int, number:int):SubCommandPayload
		{
			return new SubCommandPayload(new SpawnObjectsPayload(type, new Vector.<Point>(number)));
		}
	}

}