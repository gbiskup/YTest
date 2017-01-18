package yagerTest.view.basicViewComponent 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.osflash.signals.Signal;
	import yagerTest.view.basicViewComponent.IViewComponent;
	
	/**
	 * Basic class for ui components and views. ViewComponent will call init after adding to stage and destroy before removing.
	 * Re-initializing after removing from stage is not supported.
	 * @author gbiskup
	 */
	public class ViewComponent extends Sprite implements IViewComponent
	{
		private var _initializedSignal:Signal = new Signal(IViewComponent);
		private var _initializationFailedSignal:Signal = new Signal(IViewComponent);
		
		private var _isInitialized:Boolean;
		
		// Counts children that aren't initialized immediatelly after adding them to stage.
		private var pendingChildren:uint;
		
		public function ViewComponent() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			constructChildren();
			if (areAllChildrenReady())
			{
				init();
			}
		}
		
		private function areAllChildrenReady():Boolean
		{
			return pendingChildren == 0;
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			destroy();
		}
		
		/**
		 * "Abstract" function providing good place to create children. If child components added with addChildComponent need time to properly initialize they will delay init function
		 * of this component until all the children are ready.
		 */
		protected function constructChildren():void
		{
			// Override me.
		}
		
		/**
		 * Adds child component to display list and delays parent's init function until all children are initialized.
		 */
		protected function addChildComponent(viewComponent:ViewComponent):void
		{
			addChild(viewComponent);
			if (!viewComponent.isInitialized)
			{
				pendingChildren++;
				viewComponent.initializedSignal.add(onChildInitialized);
				viewComponent.initializationFailedSignal.add(onChildInitializationFailed);
			}
		}
		
		/**
		 * Signal handler reporting problem with child initialization.
		 */
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
			childComponent.initializationFailedSignal.remove(onChildInitializationFailed);
			if (!isInitialized && areAllChildrenReady())
			{
				init();
			}
		}

		/**
		 * Function called after this object is added to stage and all it's children added with addChildComponent are done with their initialization.
		 */
		protected function init():void
		{
			_isInitialized = true;
			initializedSignal.dispatch(this);
		}
		
		/**
		 * Cleanup function called after removing this object from the stage.
		 */
		protected function destroy():void
		{
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			initializedSignal.removeAll();
			initializationFailedSignal.removeAll();
		}
		
		public function get isInitialized():Boolean 
		{
			return _isInitialized;
		}
		
		/**
		 * Signal dispatched after init function. Provides IViewComponent as parameter to the listener function.
		 */
		public function get initializedSignal():Signal 
		{
			return _initializedSignal;
		}
		
		/**
		 * Signal dispatched if initialization went wrong. Provides IViewComponent as parameter to the listener function.
		 */
		public function get initializationFailedSignal():Signal 
		{
			return _initializationFailedSignal;
		}
	}

}
