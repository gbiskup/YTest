package factories.animations 
{
	import com.gskinner.motion.GTween;
	import com.gskinner.motion.GTweenTimeline;
	import flash.display.DisplayObject;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class AnimationFactory 
	{
		
		public function AnimationFactory() 
		{
			
		}
		
		public static function CreateShowThenHideAnimation(target:DisplayObject, fadeInTime:Number = 1.0, sustainTime:Number = 2.0, fadeOutTime:Number = 1.0):GTweenTimeline
		{
			var animationTimeline:GTweenTimeline = new GTweenTimeline(target);
			var fadeInTween:GTween =  new GTween (target, fadeInTime, {alpha:1.0});
			
			animationTimeline.addTween(0.0, fadeInTween);
			
			var fadeOutTween:GTween = new GTween(target, fadeOutTime, {alpha:0.0});
			animationTimeline.addTween(fadeInTime + sustainTime, fadeOutTween);
			
			animationTimeline.calculateDuration();
		
			return animationTimeline;
		}
		
	}

}