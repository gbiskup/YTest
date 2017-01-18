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
	public class IntroAuthorScreen extends BasicScreen 
	{
		private var mainTitle:TextField;
		private var subTitle:TextField;
		
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
		
		private function playAnimation():void
		{
			animationTimeLine = new GTweenTimeline(this);
			animationTimeLine.addTween(0.5, AnimationFactory.createShowThenHideAnimation(mainTitle, 0.5, 2.0, 0.5));
			animationTimeLine.addTween(0.75, AnimationFactory.createShowThenHideAnimation(subTitle, 0.5, 2.0, 0.5));
			animationTimeLine.calculateDuration();
			animationTimeLine.delay = 0.5;
			animationTimeLine.onComplete = onAnimationComplete;
		}
		
		override protected function onClick(event:MouseEvent):void
		{
			exitScreen();
		}
		
		private function onAnimationComplete(target:GTween):void
		{
			exitScreen();
		}
		
		private function initTextFields():void
		{
			
			// Main title
			mainTitle = TextFieldFactory.createTextField(60);
			mainTitle.text = "Grzegorz Biskup";
			addChild(mainTitle);
			AlignDisplayObject.center(mainTitle, stage.getBounds(stage));
	
			// Subtitle
			subTitle = TextFieldFactory.createTextField(25);
			subTitle.text = "(a.k.a. Bishop)";
			//subTitle.filters = [ new GlowFilter(0xFFAAAA, 1, 2, 2, 2, 2 ) ];
			addChild(subTitle);
			subTitle.x = stage.stageWidth / 2 - subTitle.width / 2;
			subTitle.y = mainTitle.y + mainTitle.textHeight + 10;
		}
	}

}
