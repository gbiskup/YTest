package yagerTest.view.uiComponents.menu 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import com.sibirjak.asdpcbeta.layout.VLayout;
	import flash.events.Event;
	import flash.utils.Dictionary;
	import yagerTest.factories.animations.AnimationFactory;
	import yagerTest.view.uiComponents.button.MyButton;
	
	/**
	 * Implementation for IMyVertical abstraction. This class must extend flash.display.DisplayObject.
	 * @author gbiskup
	 */
	public class MyVerticalMenu extends VLayout implements IMyVerticalMenu
	{
		private static const ANIMATION_DELAY:Number = 0.1;
		
		private var buttonsNum:uint;
		
		private var buttonCollection:Dictionary = new Dictionary;
		
		private var animationTimeline:GTweenTimeline;
		
		public function MyVerticalMenu()
		{
			super();
			animationTimeline = new GTweenTimeline(this);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		
		private function onRemovedFromStage(event:Event):void
		{
			animationTimeline.paused = true;
		}
		
		public function addButton(button:MyButton, id:String = null):void
		{
			buttonsNum++;
			addChild(button);
			layoutChildren();
			addShowButtonAnimation(button, buttonsNum);
			if (id)
			{
				buttonCollection[id] = button;
			}
		}
		
		public function getButtonById(id:String):MyButton
		{
			return buttonCollection[id];
		}
		
		public function showAnimation():void
		{
			animationTimeline.calculateDuration();
			animationTimeline.gotoAndPlay(0);
		}
		
		private function addShowButtonAnimation(button:MyButton, index:int):void
		{
			var tween:GTween = AnimationFactory.createShowAnimation(button);
			animationTimeline.addTween(index*ANIMATION_DELAY, tween);
		}
	}

}
