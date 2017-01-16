package yagerTest.model 
{
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayModel 
	{
		private var _score:uint;
		private var _timeLimit:uint;
		private var _grid:GridModel;
		
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
	}

}