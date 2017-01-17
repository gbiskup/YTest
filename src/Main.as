package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.extensions.contextView.ContextViewExtension;
	import robotlegs.bender.extensions.contextView.ContextViewListenerConfig;
	import robotlegs.bender.extensions.contextView.StageSyncExtension;
	import robotlegs.bender.extensions.directCommandMap.DirectCommandMapExtension;
	import robotlegs.bender.extensions.eventCommandMap.EventCommandMapExtension;
	import robotlegs.bender.extensions.eventDispatcher.EventDispatcherExtension;
	import robotlegs.bender.extensions.localEventMap.LocalEventMapExtension;
	import robotlegs.bender.extensions.mediatorMap.MediatorMapExtension;
	import robotlegs.bender.extensions.modularity.ModularityExtension;
	import robotlegs.bender.extensions.viewManager.StageCrawlerExtension;
	import robotlegs.bender.extensions.viewManager.StageObserverExtension;
	import robotlegs.bender.extensions.viewManager.ViewManagerExtension;
	import robotlegs.bender.extensions.viewProcessorMap.ViewProcessorMapExtension;
	import robotlegs.bender.extensions.vigilance.VigilanceExtension;
	import robotlegs.bender.framework.api.IInjector;
	import robotlegs.bender.framework.api.LogLevel;
	import robotlegs.bender.framework.impl.Context;
	import yagerTest.screens.ScreenManager;
	import yagerTest.commands.startup.InitGameScreensCommand;
	import ApplicationConfig;
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
			context.install(
				VigilanceExtension,
				ContextViewExtension,
				EventDispatcherExtension,
				ModularityExtension,
				DirectCommandMapExtension,
				EventCommandMapExtension,
				LocalEventMapExtension,
				ViewManagerExtension,
				StageObserverExtension,
				MediatorMapExtension,
				ViewProcessorMapExtension,
				StageCrawlerExtension,
				StageSyncExtension
			);
			context.configure(ContextViewListenerConfig);
			context.configure(ApplicationConfig);
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