package yagerTest.model 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayModel 
	{
		private var _playerPositionUpdated:Signal = new Signal();
		private var _score:uint;
		private var _timeLimit:uint;
		private var _grid:GridModel;

		private var _playerPosition:Point = new Point();
		
		public function setGrid(grid:GridModel):void
		{
			_grid = grid;
		}
		
		public function setScore(newScore:uint):void
		{
			_score = newScore;
		}
		
		public function setTimeLimit(timeLimit:uint):void
		{
			_timeLimit = timeLimit;
		}
		
		public function setPlayerPosition(playerGridPosition:Point):void 
		{
			if (!playerGridPosition.equals(playerPosition))
			{
				grid.setObjectTypeAt(playerPosition.x, playerPosition.y, GameObjectTypes.EMPTY);
				playerPosition.copyFrom(playerGridPosition);
				grid.setObjectTypeAt(playerPosition.x, playerPosition.y, GameObjectTypes.PLAYER);
				playerPositionUpdated.dispatch();
			}
		}
		
		public function get grid():GridModel
		{
			return _grid;
		}
		
		public function get timeLimit():uint 
		{
			return _timeLimit;
		}
		
		public function get score():uint 
		{
			return _score;
		}
		
		public function get playerPositionUpdated():Signal 
		{
			return _playerPositionUpdated;
		}
		
		public function get playerPosition():Point 
		{
			return _playerPosition;
		}
	}

}