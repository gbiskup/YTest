package yagerTest.screens.gameplay.hud 
{
	import flash.geom.Point;
	import yagerTest.factories.uiComponents.MenuFactory;
	import yagerTest.view.utilities.AlignAnchors;
	import yagerTest.view.basicViewComponent.ViewComponent;
	import yagerTest.view.uiComponents.HudLabel;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class HudView extends ViewComponent implements IHudView
	{
		
		private var timeLabel:HudLabel;
		
		private var scoreLabel:HudLabel;
		
		override protected function constructChildren():void
		{
			super.constructChildren();
			var rightPadding:Point = MenuFactory.defaultPadding.clone();
			rightPadding.x *=-1;
			timeLabel = new HudLabel(null, MenuFactory.defaultPadding);
			timeLabel.setLabel("Time: ");
			addChildComponent(timeLabel);
			
			scoreLabel = new HudLabel(AlignAnchors.RIGHT_TOP, rightPadding);
			scoreLabel.setLabel("Score: ");
			addChildComponent(scoreLabel);
		}
		
		public function showTime(time:Number):void 
		{
			timeLabel.setValue(time);
		}
		
		public function showScore(score:int):void 
		{
			scoreLabel.setValue(score);
		}
		
	}

}