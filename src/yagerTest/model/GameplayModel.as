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
		private var _timeUpdated:Signal = new Signal(uint);
		private var _scoreUpdated:Signal = new Signal(uint);
		private var _playerPositionUpdated:Signal = new Signal();
		private var _score:uint;
		private var _timeLimit:uint;
		private var _timeLeft:uint;
		private var _grid:GridModel;

		private var _playerPosition:Point = new Point();
		
		public function setGrid(grid:GridModel):void
		{
			_grid = grid;
		}
		
		public function setScore(newScore:uint):void
		{
			if (newScore != _score)
			{
				_score = newScore;
				scoreUpdated.dispatch(_score);
			}
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
		
		public function setTimeLeft(time:uint):void 
		{
			if (_timeLeft != time)
			{
				_timeLeft = time;
				timeUpdated.dispatch(_timeLeft);
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

		public function get timeUpdated():Signal 
		{
			return _timeUpdated;
		}
		
		public function get playerPosition():Point 
		{
			return _playerPosition;
		}
		
		public function get timeLeft():uint 
		{
			return _timeLeft;
		}
		
		public function get scoreUpdated():Signal 
		{
			return _scoreUpdated;
		}
		
	}

}