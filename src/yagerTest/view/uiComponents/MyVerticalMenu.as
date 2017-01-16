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
		private var buttonCollection:Vector.<MyButton> = new Vector.<MyButton>();
		
		public function addButton(button:MyButton):void
		{
			addChild(button);
			buttonCollection.push(button);
			layoutChildren();
		}
		
		public function showAnimation():void
		{
			for (var i:int = 0; i < buttonCollection.length; i++)
			{
				playShowButtonAnimation(buttonCollection[i], i);
			}
		}
		
		private function playShowButtonAnimation(button:MyButton, index:int):void
		{
			var tween:GTween = AnimationFactory.createShowAnimation(button);
			tween.delay = (index + 1) * 0.1;
		}
	}

}