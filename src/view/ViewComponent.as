package view 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ViewComponent extends Sprite 
	{
		
		public function ViewComponent() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
		protected function init():void
		{
			
		}
	}

}