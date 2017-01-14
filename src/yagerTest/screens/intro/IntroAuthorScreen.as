package yagerTest.screens.intro 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextFormat;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.AntiAliasType;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import yagerTest.view.AlignDisplayObject;
	import yagerTest.view.ViewComponent;
	import yagerTest.factories.animations.AnimationFactory;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class IntroAuthorScreen extends BasicScreen 
	{
		private var mainTitle:TextField;
		private var subTitle:TextField;
		
		private var animationTimeLine:GTweenTimeline;
		
		public function IntroAuthorScreen() 
		{
			super();
		}
		
		override protected function init():void
		{
			super.init();
			initTextFields();
			playAnimation();
		}
		
		private function playAnimation():void
		{
			mainTitle.alpha = 0.0;
			subTitle.alpha = 0.0;
			animationTimeLine = new GTweenTimeline(this);
			animationTimeLine.addTween(0.5, AnimationFactory.CreateShowThenHideAnimation(mainTitle, 0.5, 2.0, 0.5));
			animationTimeLine.addTween(0.75, AnimationFactory.CreateShowThenHideAnimation(subTitle, 0.5, 2.0, 0.5));
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