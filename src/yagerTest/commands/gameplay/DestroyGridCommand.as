package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GridModel;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class DestroyGridCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		public function execute():void 
		{
			injector.unmap(GridModel);
		}
		
	}

}