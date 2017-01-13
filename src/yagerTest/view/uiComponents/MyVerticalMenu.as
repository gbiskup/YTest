package yagerTest.view.uiComponents 
{
	import com.sibirjak.asdpcbeta.layout.VLayout;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MyVerticalMenu extends VLayout implements IMyVerticalMenu
	{
		public function addButton(button:MyButton):void
		{
			addChild(button);
			layoutChildren();
		}
	}

}