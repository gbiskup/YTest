package yagerTest.screens 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class BasicScreen extends ViewComponent 
	{
		private var mouseMask:Sprite = new Sprite();
		
		public function BasicScreen() 
		{
			super();
		}
		
		override protected function init():void
		{
			super.init();
			initMouseMask();
			updateMouseMaskSize();
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
			mouseMask.alpha = 0.5;
			addChild(mouseMask);			
		}
		
		protected function onClick(event:MouseEvent):void
		{
			
		}
		
		protected function exitScreen():void
		{
			dispatchEvent(new ScreenEvent(ScreenEvent.EXIT_SCREEN));
		}
		
	}

}