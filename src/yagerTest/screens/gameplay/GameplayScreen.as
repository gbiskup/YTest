package yagerTest.screens.gameplay 
{
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import org.osflash.signals.Signal;
	import yagerTest.factories.uiComponents.ButtonFactory;
	import yagerTest.factories.uiComponents.MenuFactory;
	import yagerTest.model.GameplayConstants;
	import yagerTest.model.GameplayModel;
	import yagerTest.model.Size;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.gameplayView.GameplayView;
	import yagerTest.screens.gameplay.hud.HudView;
	import yagerTest.screens.mainMenu.UserActions;
	import yagerTest.signals.StringSignal;
	import yagerTest.view.uiComponents.menu.MyVerticalMenu;
	import yagerTest.view.utilities.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreen extends BasicScreen implements IGameplayScreen
	{
		private var _userActionSignal:Signal = new StringSignal();
	
		private var gameplayView:GameplayView;
		
		private var pauseMenu:MyVerticalMenu;
		
		private var hud:HudView;
		
		private var isPaused:Boolean;
		
		override protected function constructChildren():void
		{
			super.constructChildren();
			initMenu();
			initHud();
		}
		
		override protected function init():void
		{
			super.init();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
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
		
		private function initHud():void
		{
			hud = new HudView();
			addChild(hud);
		}
	
		public function initGameplay(gameplayModel:GameplayModel):void 
		{
			initGrid(gameplayModel.grid.size);
			gameplayView.startTime(gameplayModel.timeLimit);
			gameplayView.setCoinsRespawnTime(GameplayConstants.COINS_RESPAWN_TIME);
		}
		
		private function initGrid(gridSize:Size):void
		{
			gameplayView = new GameplayView(gridSize, GameplayConstants.GRID_CELL_SIZE);
			addChild(gameplayView);
			AlignDisplayObject.center(gameplayView, getBounds(this));
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
			super.destroy();
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function pause():void
		{
			gameplayView.pause();
			pauseMenu.visible = true;
			pauseMenu.showAnimation();
		}
		
		private function resume():void
		{
			gameplayView.resume();
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