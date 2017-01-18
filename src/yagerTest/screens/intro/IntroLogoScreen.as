package yagerTest.screens.intro 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import yagerTest.factories.animations.AnimationFactory;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import yagerTest.view.utilities.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class IntroLogoScreen extends BasicScreen 
	{
		private var gameTitle:TextField;
		private var animationTimeLine:GTweenTimeline;
		
		override protected function init():void
		{
			super.init();
			initTextFields();
			playAnimation();
		}
		
		override protected function destroy():void
		{
			animationTimeLine.paused = true;
			super.destroy();
		}
		
		override protected function onClick(event:MouseEvent):void
		{
			exitScreen();
		}
		
		private function playAnimation():void
		{
			animationTimeLine = new GTweenTimeline(this);
			animationTimeLine.addTween(0.5, AnimationFactory.createShowThenHideAnimation(gameTitle, 0.5, 2.0, 0.5));
			animationTimeLine.calculateDuration();
			animationTimeLine.delay = 0.5;
			animationTimeLine.onComplete = onAnimationComplete;
		}
		
		private function onAnimationComplete(target:GTween):void
		{
			exitScreen();
		}
		
		private function initTextFields():void
		{
			gameTitle = TextFieldFactory.createTextField(60);
			gameTitle.text = "YagerTest";
			addChild(gameTitle);
			AlignDisplayObject.center(gameTitle, stage.getBounds(stage));
		}
	}

}
