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
			gridModel.setObjectTypeAt(2, 2, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 3, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 4, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 5, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(3, 6, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(15, 15, GameObjectTypes.COIN);
			gridModel.setObjectTypeAt(31, 31, GameObjectTypes.COIN);
		}
		
	}

}