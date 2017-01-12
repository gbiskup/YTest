package screens.splash 
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
	import view.ViewComponent;
	import Tween
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class SplashScreen extends ViewComponent 
	{
		private var mainTitle:TextField;
		private var subTitle:TextField;
		
		private var animationTimeLine:GTween;
		
		public function SplashScreen() 
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
			mainTitle.alpha = 0.0;
			
			
			animationTimeLine = new GTweenTimeline(mainTitle);
		}
		
		private function initTextFields():void
		{
			// Main title
			mainTitle = new TextField();
			var format:TextFormat = new TextFormat();
            format.font = "Arial Bold";
            format.color = 0xaFFFFFF;
            format.size = 60;
			format.bold = true;
			mainTitle.defaultTextFormat = format;
			mainTitle.selectable = false;
			mainTitle.autoSize = TextFieldAutoSize.LEFT;
			mainTitle.text = "Grzegorz Biskup";
			
			addChild(mainTitle);
			mainTitle.x = stage.stageWidth / 2 - mainTitle.width / 2;
			mainTitle.y = stage.stageHeight / 2 - mainTitle.height / 2;
			
			mainTitle.filters = [ new GlowFilter(0xFFAAAA) ];
			
			// Subtitle
			subTitle = new TextField();
			var format:TextFormat = new TextFormat();
            format.font = "Arial Bold";
            format.color = 0xaFFFFFF;
            format.size = 30;
			format.bold = true;
			subTitle.defaultTextFormat = format;
			subTitle.selectable = false;
			subTitle.autoSize = TextFieldAutoSize.LEFT;
			subTitle.text = "(a.k.a. Bishop)";
			
			subTitle.filters = [ new GlowFilter(0xFFAAAA, 1, 4, 4) ];
			
			addChild(subTitle);
			subTitle.x = stage.stageWidth / 2 - subTitle.width / 2;
			subTitle.y = mainTitle.y + mainTitle.textHeight + 10;
		}
	}

}