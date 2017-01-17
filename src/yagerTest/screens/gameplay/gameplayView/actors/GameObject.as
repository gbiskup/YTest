package yagerTest.screens.gameplay.gameplayView.actors 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameObject 
	{
		public var gridPosition:Point;
		public var avatar:Sprite;
		
		public function GameObject(gridPosition:Point, avatar:Sprite) 
		{
			this.avatar = avatar;
			this.gridPosition = gridPosition;
		}
		
	}

}