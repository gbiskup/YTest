package yagerTest.commands.gameplay 
{
	/**
	 * ...
	 * @author gbiskup
	 */
	public class SpawnObjectsPayload
	{
		public var number:uint;
		public var type:int;
		
		public function SpawnObjectsPayload(type:int, number:uint) 
		{
			this.number = number;
			this.type = type;
		}
		
	}

}
