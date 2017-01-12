package startup 
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class YagerConfig implements IConfig 
	{
		[Inject]
		public var mediatorMap:IMediatorMap;
		
		public function configure():void
		{
			//mediatorMap.map()
		}
	}

}