package yagerTest.screens.gameplay 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import org.osflash.signals.Signal;
	import yagerTest.factories.gameObjects.ActorsFactory;
	import yagerTest.factories.uiComponents.ButtonFactory;
	import yagerTest.factories.uiComponents.MenuFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.gameplayView.GameplayView;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.screens.mainMenu.UserActions;
	import yagerTest.view.AlignAnchors;
	import yagerTest.view.AlignDisplayObject;
	import yagerTest.view.uiComponents.HudLabel;
	import yagerTest.view.uiComponents.MyVerticalMenu;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreen extends BasicScreen implements IGameplayScreen
	{
		private var _userActionSignal:Signal = new Signal(String);
		
		private var gameView:GameplayView;
		
		private var pauseMenu:MyVerticalMenu;
		
		private var timeLabel:HudLabel;
		
		private var scoreLabel:HudLabel;
		
		private var isPaused:Boolean;
		
		private var timeLimit:Number;
		
		private var score:int;
		
		private var timeLine:GTweenTimeline = new GTweenTimeline();
		
		public function initGrid(gridSize:Point, cellSize:Point):void
		{
			gameView = new GameplayView(gridSize, cellSize);
			addChild(gameView);
		}
		
		override protected function init():void
		{
			super.init();
			AlignDisplayObject.center(gameView, getBounds(this));
			initMenu();
			initHud();
			if (!isNaN(timeLimit))
			{
				startTime();
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private function initHud():void
		{
			var rightPadding:Point = MenuFactory.defaultPadding.clone();
			rightPadding.x *=-1;
			timeLabel = new HudLabel(null, MenuFactory.defaultPadding);
			timeLabel.setLabel("Time: ");
			addChild(timeLabel);
			
			scoreLabel = new HudLabel(AlignAnchors.RIGHT_TOP, rightPadding);
			scoreLabel.setLabel("Score: ");
			addChild(scoreLabel);
		}
		
		public function start(timeLimit:Number):void
		{
			timeLimit = timeLimit;
			if (isInitialized)
			{
				startTime();				
			}
		}
		
		private function startTime():void
		{
			timeLine.duration = timeLimit;
			timeLine.onComplete = timeComplete;
			timeLine.onChange = timeChange;
			timeLine.gotoAndPlay(0);
		}
		
		private function timeComplete(tween:GTween):void
		{
			togglePause();
		}
		
		private function timeChange(tween:GTween):void
		{
			timeLabel.setValue(timeLimit - tween.position);
		}
		
		private function initMenu():void
		{
			pauseMenu = MenuFactory.craeteVerticalMenu();
			addChild(pauseMenu);
			pauseMenu.addButton(ButtonFactory.createTextButton("Resume", onResume));
			pauseMenu.addButton(ButtonFactory.createTextButton("Restart", onRestart));
			pauseMenu.addButton(ButtonFactory.createTextButton("Exit", onExit));
			AlignDisplayObject.center(pauseMenu, getBounds(this));
			pauseMenu.visible = isPaused;
		}
		
		public function onExit():void 
		{
			userActionSignal.dispatch(UserActions.EXIT_GAME);
		}
		
		private function onResume():void 
		{
			togglePause();
		}
		
		public function onRestart():void
		{
			userActionSignal.dispatch(UserActions.RESTART_GAME);
		}
		
		override protected function destroy():void
		{
			timeLine.paused = true;
			super.destroy();
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function pause():void
		{
			gameView.pause();
			timeLine.paused = true;
			pauseMenu.visible = true;
			pauseMenu.showAnimation();
		}
		
		private function resume():void
		{
			gameView.resume();
			timeLine.paused = false;
			pauseMenu.visible = false;
		}
		
		private function togglePause():void
		{
			isPaused = !isPaused;
			if (isPaused)
			{
				pause();
			}
			else
			{
				resume();
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.ESCAPE)
			{
				togglePause();
			}
		}
		
		public function get userActionSignal():Signal 
		{
			return _userActionSignal;
		}
	}

}