package yagerTest.view 
{
	import org.osflash.signals.Signal;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public interface IViewComponent 
	{
		function get initializedSignal():Signal;
		function get initializationFailedSignal():Signal;
	}
	
}