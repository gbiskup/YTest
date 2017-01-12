package screens 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ScreenManager 
	{
		private var screenContainer:Sprite;
		
		public function ScreenManager(container:Sprite) 
		{
			screenContainer = container;
		}
		
		public function showScreen(screen:Sprite):void
		{
			screenContainer.addChild(screen);
		}
	}

}