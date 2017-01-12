package screens 
{
	import flash.events.Event;
	import view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class BasicScreen extends ViewComponent 
	{
		
		public function BasicScreen() 
		{
			super();
			
		}
		
		protected function exitScreen():void
		{
			dispatchEvent(new ScreenEvent(ScreenEvent.EXIT_SCREEN));
		}
		
	}

}