package animations 
{
	import com.gskinner.motion.GTweenTimeline;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class AnimationFactory 
	{
		
		public function AnimationFactory() 
		{
			
		}
		
		public static function CreateSplashScreenTextAnimation():GTweenTimeline
		{
			var animationTimeline:GTweenTimeline = new GTweenTimeline(null, 1.0, {alpha:1.0}, null, null, []);
		}
		
	}

}