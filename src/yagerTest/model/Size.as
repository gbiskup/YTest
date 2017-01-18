package yagerTest.model 
{
	/**
	 * ...
	 * @author gbiskup
	 */
	public class Size 
	{
		public var width:uint;
		public var height:uint;
		
		public function Size(width:uint, height:uint) 
		{
			this.width = width;
			this.height = height;
		}
		
		public function clone():Size
		{
			return new Size(width, height);
		}
	}

}
