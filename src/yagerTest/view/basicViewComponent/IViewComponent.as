package yagerTest.view.basicViewComponent 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IViewComponent 
	{
		/**
		 * Signal dispatched after init function. Provides IViewComponent as parameter to the listener function.
		 */
		function get initializedSignal():Signal;
		
		/**
		 * Signal dispatched if initialization went wrong. Provides IViewComponent as parameter to the listener function.
		 */
		function get initializationFailedSignal():Signal;
	}
	
}
