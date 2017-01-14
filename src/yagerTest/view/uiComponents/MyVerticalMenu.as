package yagerTest.view.uiComponents 
{
	import com.gskinner.motion.GTween;
	import com.sibirjak.asdpcbeta.layout.VLayout;
	import yagerTest.factories.animations.AnimationFactory;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class MyVerticalMenu extends VLayout implements IMyVerticalMenu
	{
		private var buttonNumber:int;
		
		public function addButton(button:MyButton):void
		{
			addChild(button);
			buttonNumber++;
			var tween:GTween = AnimationFactory.createShowAnimation(button);
			tween.delay = buttonNumber * 0.2;
			layoutChildren();
		}
	}

}