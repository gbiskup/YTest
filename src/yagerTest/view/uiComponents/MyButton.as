package yagerTest.view.uiComponents 
{
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.button.ButtonEvent;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MyButton extends Button implements IMyButton
	{
		private var callback:Function;
		
		public function MyButton(callback:Function)
		{
			super();
			this.callback = callback;
			addEventListener(ButtonEvent.CLICK, onButtonClick, false, 0, true);
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
		
	}

}