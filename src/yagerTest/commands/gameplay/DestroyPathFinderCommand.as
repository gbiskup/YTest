package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.utilities.IPathFinder;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class DestroyPathFinderCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		public function execute():void 
		{
			injector.unmap(IPathFinder);
		}
	}

}