package yagerTest.commands.gameplay 
{
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class StartGameMacro extends SequenceMacro 
	{	
		override public function prepare():void
		{
			add(InitGridCommand);
			add(InitGameScreenCommand);
		}
	}

}