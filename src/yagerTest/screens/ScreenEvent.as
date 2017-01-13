package yagerTest.screens 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ScreenEvent extends Event
	{
		public static const EXIT_SCREEN:String = "exit_screen";
	
		function ScreenEvent(type:String)
		{
			super(type);
		}
	}

}