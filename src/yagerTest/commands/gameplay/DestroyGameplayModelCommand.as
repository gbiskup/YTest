package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GameplayModel;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class DestroyGameplayModelCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		public function execute():void 
		{
			injector.unmap(GameplayModel);
		}
		
	}

}
