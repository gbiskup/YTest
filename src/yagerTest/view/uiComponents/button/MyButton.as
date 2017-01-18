package yagerTest.view.uiComponents.button 
{
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.button.ButtonEvent;
	import yagerTest.view.uiComponents.button.IMyButton;
	
	/**
	 * Implementation for IMyButton abstraction. This class must extend flash.display.DisplayObject.
	 * @author gbiskup
	 */
	public class MyButton extends Button implements IMyButton
	{
		private var callback:Function;
		
		public function MyButton(callback:Function)
		{
			super();
			this.callback = callback;
			addEventListener(ButtonEvent.CLICK, onButtonClick);
		}
		
		public function setCallback(callback:Function):void
		{
			this.callback = callback;
		}
		
		private function onButtonClick(event:ButtonEvent):void
		{
			if (callback != null)
			{
				callback();
			}
		}
		
		override public function set enabled(isEnabled:Boolean):void
		{
			super.enabled = isEnabled;
			buttonMode = isEnabled;
		}
		
	}

}