package yagerTest.model 
{
	import flash.geom.Point;
	import org.osflash.signals.Signal;
	
	/**
	 * Stores gameplay properties and grid. Provides signals for time, score, player position and grid updates.
	 * @author gbiskup
	 */
	public class GameplayModel 
	{
		private var _objectsSpawnedSignal:Signal = new Signal(int);
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
		
		public function reset():void 
		{
			playerPosition.setTo( 0, 0);
		}

		
		/**
		 * Sets score and triggers scoreUpdate signal if score value has changed.
		 */
		public function setScore(newScore:uint):void
		{
			if (newScore != _score)
			{
				_score = newScore;
				scoreUpdated.dispatch(_score);
			}
		}
		
		/**
		 * Sets time left and triggers timeChanged signal on time change.
		 */
		public function setTimeLeft(time:uint):void 
		{
			if (_timeLeft != time)
			{
				_timeLeft = time;
				timeUpdated.dispatch(_timeLeft);
			}
		}
		
		public function setTimeLimit(timeLimit:uint):void
		{
			_timeLimit = timeLimit;
		}
		
		/**
		 * Updates player position in the grid and notifies with signal if the new position differs from the old one.
		 */
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
		
		/**
		 * Notifies listeners that objects where spawned. Passes objects type as listeners' parameter.
		 */
		public function get objectsSpawnedSignal():Signal 
		{
			return _objectsSpawnedSignal;
		}

		/**
		 * Triggers listeners with no parameters when player position changes.
		 */
		public function get playerPositionUpdated():Signal 
		{
			return _playerPositionUpdated;
		}
		
		/**
		 * Triggers timeUpdate listeners when time changes. Passes uint time left as parameter.
		 */
		public function get timeUpdated():Signal 
		{
			return _timeUpdated;
		}
	
		/**
		 * Triggers scoreUpdate listeners when score changes. Passes current score (uint) as parameter.
		 */
		public function get scoreUpdated():Signal 
		{
			return _scoreUpdated;
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
		
		public function get playerPosition():Point 
		{
			return _playerPosition;
		}
		
		public function get timeLeft():uint 
		{
			return _timeLeft;
		}
		
		[PreDestroy]
		public function dest():void
		{
			trace("I'm destroyed");
		}
	}

}
