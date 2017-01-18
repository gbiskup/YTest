package yagerTest.view.uiComponents.menu 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import com.sibirjak.asdpcbeta.layout.VLayout;
	import flash.events.Event;
	import yagerTest.factories.animations.AnimationFactory;
	import yagerTest.view.uiComponents.button.MyButton;
	
	/**
	 * Implementation for IMyVertical abstraction. This class must extend flash.display.DisplayObject.
	 * @author gbiskup
	 */
	public class MyVerticalMenu extends VLayout implements IMyVerticalMenu
	{
		private var buttonCollection:Vector.<MyButton> = new Vector.<MyButton>();
		
		private var animationTimeline:GTweenTimeline;
		
		public function MyVerticalMenu()
		{
			super();
			animationTimeline = new GTweenTimeline(this);
			addEventListener(Event.REMOVED, onRemoved);
		}
		
		private function onRemoved(event:Event):void
		{
			animationTimeline.paused = true;
		}
		
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
			animationTimeline.gotoAndPlay(0);
		}
		
		private function playShowButtonAnimation(button:MyButton, index:int):void
		{
			var tween:GTween = AnimationFactory.createShowAnimation(button);
			animationTimeline.addTween(index * 0.1, tween);
		}
	}

}
