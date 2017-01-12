package screens.splash 
{
	import screens.BasicScreen;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFieldAutoSize;
	import animations.AnimationFactory;
	import com.gskinner.motion.GTweenTimeline
	import com.gskinner.motion.GTween;
	import flash.filters.GlowFilter;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class IntroLogoScreen extends BasicScreen 
	{
		private var gameTitle:TextField;
		private var animationTimeLine:GTweenTimeline;
		
		public function IntroLogoScreen() 
		{
			super();
			
		}
		override protected function init():void
		{
			initTextFields();
			playAnimation();
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
			gameTitle = new TextField();
			var format:TextFormat = new TextFormat();
            format.font = "Arial Bold";
            format.color = 0xaFFFFFF;
            format.size = 60;
			format.bold = true;
			gameTitle.defaultTextFormat = format;
			gameTitle.selectable = false;
			gameTitle.autoSize = TextFieldAutoSize.LEFT;
			gameTitle.text = "YagerTest";
			
			gameTitle.filters = [ new GlowFilter(0xFFAAAA, 1, 2, 2, 3, 3 ) ];
			
			addChild(gameTitle);
			gameTitle.x = stage.stageWidth / 2 - gameTitle.width / 2;
			gameTitle.y = stage.stageHeight / 2 - gameTitle.height / 2;
		}
	}

}