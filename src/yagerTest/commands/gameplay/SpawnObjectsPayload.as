package yagerTest.commands.gameplay 
{
	import flash.geom.Point;
	import robotlegs.bender.extensions.commandCenter.api.CommandPayload;
	import yagerTest.model.GameObjectTypes;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class SpawnObjectsPayload
	{
		public var positions:Vector.<Point>;
		public var type:int;
		
		public function SpawnObjectsPayload(type:int, positions:Vector.<Point> = null) 
		{
			if (!positions)
			{
				this.positions = new Vector.<Point>();
			}
			else
			{
				this.positions = positions;
			}
			
			this.type = type;
		}
		
	}

}