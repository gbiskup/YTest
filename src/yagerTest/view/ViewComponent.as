package yagerTest.view 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ViewComponent extends Sprite 
	{
		private var initializedSignal:Signal = new Signal(ViewComponent);
		private var initializationFailed:Signal = new Signal(ViewComponent);
		
		private var _isInitialized:Boolean;
		
		private var pendingChildren:uint;
		
		public function ViewComponent() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			constructChildren();
			if (allChildrenReady())
			{
				init();
			}
		}
		
		private function allChildrenReady():Boolean
		{
			return pendingChildren == 0;
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			destroy();
		}

		protected function constructChildren():void
		{
			
		}
		
		protected function addChildComponent(viewComponent:ViewComponent):void
		{
			addChild(viewComponent);
			if (!viewComponent.isInitialized)
			{
				pendingChildren++;
				viewComponent.initializedSignal.add(onChildInitialized);
				viewComponent.initializationFailed.add(onChildInitializationFailed);
			}
		}
		
		private function onChildInitializationFailed(childComponent:ViewComponent):void
		{
			throw new Error("View component " + childComponent + "failed to initialize.");
			endChildInitialization(childComponent);
		}
		
		private function onChildInitialized(childComponent:ViewComponent):void
		{
			endChildInitialization(childComponent);
		}

		private function endChildInitialization(childComponent:ViewComponent):void
		{
			childComponent.initializedSignal.remove(onChildInitialized);
			childComponent.initializationFailed.remove(onChildInitializationFailed);
			if (!isInitialized && allChildrenReady())
			{
				init();
			}
		}
		
		protected function init():void
		{
			_isInitialized = true;
			initializedSignal.dispatch(this);
		}
		
		protected function destroy():void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			initializedSignal.removeAll();
			initializationFailed.removeAll();
		}
		
		public function get isInitialized():Boolean 
		{
			return _isInitialized;
		}
	}

}