package yagerTest.screens.intro 
{
	import flash.events.MouseEvent;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import yagerTest.factories.animations.AnimationFactory;
	import com.gskinner.motion.GTweenTimeline
	import com.gskinner.motion.GTween;
	import flash.filters.GlowFilter;
	import flash.events.MouseEvent;
	import yagerTest.view.AlignDisplayObject;
	
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
		
		override protected function onClick(event:MouseEvent):void
		{
			exitScreen();
		}
		
		private function playAnimation():void
		{
			gameTitle.alpha = 0.0;
			animationTimeLine = new GTweenTimeline(this);
			animationTimeLine.addTween(0.5, AnimationFactory.CreateShowThenHideAnimation(gameTitle, 0.5, 2.0, 0.5));
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
			// Main title
			gameTitle = TextFieldFactory.createTextField(60);
			gameTitle.text = "YagerTest";
			
			gameTitle.filters = [ new GlowFilter(0xFFAAAA, 1, 2, 2, 3, 3 ) ];
			
			addChild(gameTitle);
			AlignDisplayObject.center(gameTitle, stage.getBounds(stage));
		}
	}

}