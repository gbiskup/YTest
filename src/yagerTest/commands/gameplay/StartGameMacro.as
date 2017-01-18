package yagerTest.commands.gameplay 
{
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	import eu.alebianco.robotlegs.utils.impl.SubCommandPayload;
	import flash.geom.Point;
	import yagerTest.commands.ShowScreenCommand;
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
			add(InitGameplayModelCommand);
			add(SpawnObjectsCommand).withPayloads(createSpawnCommandPayload(GameObjectTypes.OBSTACLE, GameplayConstants.OBSTACLES_LIMIT));
			add(InitPathFinderCommand);
			
			add(ShowScreenCommand).withPayloads(
				new SubCommandPayload(new GameplayScreen(), BasicScreen)
			);
		}
		
		private function createSpawnCommandPayload(type:int, number:uint):SubCommandPayload
		{
			return new SubCommandPayload(new SpawnObjectsPayload(type, number));
		}
	}

}