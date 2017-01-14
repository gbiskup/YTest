package yagerTest.commands.gameplay 
{
	import robotlegs.bender.extensions.commandCenter.api.ICommand;
	import robotlegs.bender.framework.api.IInjector;
	import yagerTest.model.GridModel;
	import yagerTest.model.GameObjectTypes;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class InitGridCommand implements ICommand 
	{
		[Inject]
		public var injector:IInjector;
		
		/* INTERFACE robotlegs.bender.extensions.commandCenter.api.ICommand */
		
		public function execute():void 
		{
			var gridModel:GridModel = new GridModel();
			injector.map(GridModel).toValue(gridModel);
			gridModel.setObjectTypeAt(0, 0, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(1, 1, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 6, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(15, 15, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(31, 31, GameObjectTypes.COIN);
			
			/*gridModel.setObjectTypeAt(10, 10, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(10, 11, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(10, 12, GameObjectTypes.OBSTACLE);
			gridModel.setObjectTypeAt(23, 15, GameObjectTypes.OBSTACLE);*/
			
		}
		
	}

}