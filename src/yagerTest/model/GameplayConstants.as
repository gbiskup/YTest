package yagerTest.model 
{
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameplayConstants 
	{
		public static const COINS_LIMIT:uint = 3;
		public static const COINS_RESPAWN_TIME:Number = 12.0;
		
		public static const TIME_LIMIT:Number = 120.0;
		static public const PLAYER_SPEED:Number = 100;// 500;;
		
		public static const OBSTACLES_LIMIT:uint = 128;
		public static const GRID_CELL_SIZE:Point = new Point(25, 25);
		public static const GRID_SIZE:Point = new Point(32, 32);
	}

}