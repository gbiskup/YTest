package yagerTest.screens.gameplay 
{
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import org.osflash.signals.Signal;
	import yagerTest.factories.gameObjects.ActorsFactory;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GridModel;
	import yagerTest.screens.BasicScreen;
	import yagerTest.screens.gameplay.gameplayView.GameplayView;
	import yagerTest.screens.gameplay.gameplayView.GridPositionHelper;
	import yagerTest.view.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayScreen extends BasicScreen implements IGameplayScreen
	{
		public static const GRID_CELL_SIZE:Number = 25.0;
		
		private var _togglePauseSignal:Signal = new Signal();
		
		private var gridContainer:GameplayView;
		
		public function initGrid(width:int, height:int):void
		{
			gridContainer = new GameplayView(width, height, GRID_CELL_SIZE);
			addChild(gridContainer);
		}
		
		override protected function init():void
		{
			super.init();
			AlignDisplayObject.center(gridContainer, getBounds(this));
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		override protected function destroy():void
		{
			super.destroy();
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			if (e.keyCode == Keyboard.ESCAPE)
			{
				togglePauseSignal.dispatch();
			}
		}
		
		public function addObstacleAtGridPosition(x:uint, y:uint, type:int):void
		{
			if (type != GameObjectTypes.EMPTY)
			{
				var obstacle:Sprite = ActorsFactory.createAvatarByType(type);
				var position:Point = GridPositionHelper.gridToPixelPosition(new Point(x, y), GRID_CELL_SIZE, GRID_CELL_SIZE);
				obstacle.x = position.x;
				obstacle.y = position.y;
				gridContainer.addChild(obstacle);
			}
		}
		
		public function get togglePauseSignal():Signal 
		{
			return _togglePauseSignal;
		}
		
	}

}