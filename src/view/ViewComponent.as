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
		
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			init();
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			destroy();
		}
		
		protected function init():void
		{
			
		}
		
		protected function destroy():void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
	}

}