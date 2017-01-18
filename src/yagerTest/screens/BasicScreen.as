package yagerTest.screens 
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import yagerTest.view.basicViewComponent.ViewComponent;
	
	/**
	 * Parent class for all the screens.
	 * @author gbiskup
	 */
	public class BasicScreen extends ViewComponent 
	{
		// Invisible sprite of stage's size
		private var mouseMask:Sprite = new Sprite();
		
		public function BasicScreen() 
		{
			super();
		}
		
		override protected function constructChildren():void
		{
			super.constructChildren();
			initMouseMask();
			updateMouseMaskSize();
		}
		
		override protected function init():void
		{
			super.init();
			initListeners();
		}
		
		protected function initListeners():void
		{
			addEventListener(MouseEvent.CLICK, onClick);
		}

		protected function removeListeners():void
		{
			removeEventListener(MouseEvent.CLICK, onClick);
		}
		
		override protected function destroy():void
		{
			super.destroy();
			removeListeners();
		}
		
		private function updateMouseMaskSize():void 
		{
			mouseMask.width = stage.stageWidth;
			mouseMask.height = stage.stageHeight;
		}
		
		private function initMouseMask():void 
		{
			mouseMask.graphics.beginFill(0x4444A0);
			mouseMask.graphics.drawRect(0.0, 0.0, 1.0, 1.0);
			mouseMask.graphics.endFill();
			mouseMask.alpha = 0.0;
			addChild(mouseMask);
			mouseMask.mouseEnabled = false;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			// Override me.
		}
		
		/**
		 * Triggers screen manager to remove this screen and show next one from the queue.
		 */
		protected function exitScreen():void
		{
			dispatchEvent(new ScreenEvent(ScreenEvent.EXIT_SCREEN));
		}
		
	}

}
