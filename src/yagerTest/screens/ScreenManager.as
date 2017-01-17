package yagerTest.screens 
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
		
		private var currentScreen:Sprite;
		private var screenQueue:Vector.<Sprite>;
		
		public function ScreenManager(container:Sprite) 
		{
			screenContainer = container;
			screenQueue = new Vector.<Sprite>();
		}
		
		public function addScreen(screen:Sprite):void
		{
			if (screenQueue.indexOf(screen) < 0)
			{
				screenQueue.push(screen);	
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
		
		public function showNextScreen():void
		{
			if (screenQueue.length > 0)
			{
				showScreen(screenQueue.shift());
			}
		}
	
		private function onScreenExit(event:ScreenEvent):void
		{
			removeCurrentScreen();
			showNextScreen();
		}
	}

}