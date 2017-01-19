package yagerTest.screens 
{
	import flash.display.Sprite;
	
	/**
	 * Handles screen flow and queue. Holds current screen.
	 * @author gbiskup
	 */
	public class ScreenManager 
	{
		private var screenContainer:Sprite;
		
		private var currentScreen:Sprite;
		private var screenQueue:Vector.<Class>;
		
		public function ScreenManager(container:Sprite) 
		{
			screenContainer = container;
			screenQueue = new Vector.<Class>();
		}
		
		/**
		 * Add screen to the queue. It will be shown after current screen is over.
		 */
		public function addScreen(screenClass:Class):void
		{
			if (screenQueue.indexOf(screenClass) < 0)
			{
				screenQueue.push(screenClass);	
			}
			else
			{
				throw new Error("Can't add the same screen twice");
			}
		}
		
		private function showScreen(screen:Sprite):void
		{
			removeCurrentScreen();
			currentScreen = screen;
			screenContainer.addChild(screen);
			screen.addEventListener(ScreenEvent.EXIT_SCREEN, onScreenExit);
		}
		
		private function removeCurrentScreen():void
		{
			if (currentScreen)
			{
				currentScreen.removeEventListener(ScreenEvent.EXIT_SCREEN, onScreenExit);
				screenContainer.removeChild(currentScreen);
				currentScreen = null;
			}
		}
		
		/**
		 * Shows next screen added to the queue with addScreen method or does nothing if the queue is empty.
		 */
		public function showNextScreen():void
		{
			if (screenQueue.length > 0)
			{
				var nextScreenClass:Class = screenQueue.shift();
				showScreen(new nextScreenClass());
			}
		}
	
		private function onScreenExit(event:ScreenEvent):void
		{
			removeCurrentScreen();
			showNextScreen();
		}
	}

}
