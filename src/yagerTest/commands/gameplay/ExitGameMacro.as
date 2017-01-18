package yagerTest.commands.gameplay 
{
	import eu.alebianco.robotlegs.utils.impl.SequenceMacro;
	import eu.alebianco.robotlegs.utils.impl.SubCommandPayload;
	import yagerTest.commands.ShowScreenCommand;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.mainMenu.MainMenuScreen;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ExitGameMacro extends SequenceMacro 
	{
		override public function prepare():void
		{
			add(DestroyGameplayModelCommand);
			add(DestroyPathFinderCommand);
			add(ShowScreenCommand).withPayloads(
				new SubCommandPayload(new MainMenuScreen(), BasicScreen)
			);
		}
	}

}

