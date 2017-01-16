package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.directCommandMap.DirectCommandMapExtension;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.impl.Context;
	import yagerTest.screens.ScreenManager;
	import yagerTest.commands.startup.InitGameScreensCommand;
	import YagerConfig;
	import com.gskinner.motion.GTween;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class Main extends Sprite 
	{
		private var context:Context;
		
		public function Main() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			initRobotLegs();
			initScreenManager();
			initGame();
		}
		
		private function initRobotLegs():void
		{
			context = new Context();
			context.install(MVCSBundle);
			context.install(DirectCommandMapExtension);
			context.configure(new YagerConfig());
			context.configure(new ContextView(this));
		}
		
		private function initScreenManager():void
		{
			var screenManager:ScreenManager = new ScreenManager(this);
			context.injector.map(ScreenManager).toValue(screenManager);
		}
		
		private function initGame():void
		{
			var injector:IInjector = context.injector;
			var initGameCommand:InitGameScreensCommand = injector.instantiateUnmapped(InitGameScreensCommand);
			initGameCommand.execute();
		}
		
	}
	
}