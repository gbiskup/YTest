package yagerTest.factories.gameObjects 
{
	import flash.display.Sprite;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class GameObjectAvatarFactory 
	{
		public static function createCircleAvatar(color:uint, radius:Number):Sprite
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(color);
			sprite.graphics.drawCircle( 0, 0, radius);
			sprite.graphics.endFill();
			return sprite;
		}

		public static function createSquareAvatar(color:uint, size:Number):Sprite
		{
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(color);
			sprite.graphics.drawRect( -size / 2, -size / 2, size, size);
			sprite.graphics.endFill();
			return sprite;
		}
		
		/**
		 * Creates game object's avatar for given constant from GameObjectTypes
		 */
		static public function createAvatarByType(type:int):Sprite
		{
			var avatar:Sprite;
			switch(type)
			{
				case GameObjectTypes.COIN:
					avatar = createCircleAvatar(0xf4d742, GameplayConstants.GRID_CELL_SIZE.x / 4);
					break;
					
				default:
				case GameObjectTypes.OBSTACLE:
					avatar = createSquareAvatar(0xcc7777, GameplayConstants.GRID_CELL_SIZE.x);
					break;
					
				case GameObjectTypes.PLAYER:
					avatar = createCircleAvatar(0x009900, GameplayConstants.GRID_CELL_SIZE.x / 2);
					break;
			}
			avatar.mouseEnabled = false;
			return avatar;
		}
		
	}

}
