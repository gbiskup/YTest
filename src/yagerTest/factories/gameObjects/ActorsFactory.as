package yagerTest.factories.gameObjects 
{
	import flash.display.Sprite;
	import flash.filters.GlowFilter;
	import yagerTest.model.GameObjectTypes;
	import yagerTest.model.GameplayConstants;
	import yagerTest.screens.gameplay.GameplayScreen;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ActorsFactory 
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
			sprite.filters = [new GlowFilter(color, 1.0, 8, 8)];
			return sprite;
		}

		
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
					avatar = createSquareAvatar(0xffffff, GameplayConstants.GRID_CELL_SIZE.x);
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