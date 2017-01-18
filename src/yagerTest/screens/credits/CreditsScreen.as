package yagerTest.screens.credits 
{
	import com.gskinner.motion.GTween;
	import flash.geom.Point;
	import flash.text.TextField;
	import yagerTest.factories.animations.AnimationFactory;
	import yagerTest.factories.uiComponents.ButtonFactory;
	import yagerTest.factories.uiComponents.MenuFactory;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import yagerTest.view.uiComponents.button.MyButton;
	import yagerTest.view.utilities.AlignDisplayObject;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class CreditsScreen extends BasicScreen
	{
		private var buttonAnimation:GTween;
		
		private var labelAnimation:GTween;
		
		override protected function init():void
		{
			super.init();
			initNameTextField();
			initBackButton();
		}
		
		override protected function destroy():void
		{
			buttonAnimation.paused = true;
			labelAnimation.paused = true;
			super.destroy();
		}
		
		private function initNameTextField():void
		{
			var nameTextField:TextField = TextFieldFactory.createTextField(40);
			nameTextField.text = "Programmed by Grzegorz Biskup";
			addChild(nameTextField);
			labelAnimation = AnimationFactory.createShowAnimation(nameTextField);
			AlignDisplayObject.center(nameTextField, getBounds(this));
		}
		
		private function initBackButton():void
		{
			var backButton:MyButton = ButtonFactory.createTextButton("Back", exitScreen);
			addChild(backButton);
			buttonAnimation = AnimationFactory.createShowAnimation(backButton);
			AlignDisplayObject.rightBottom(
				backButton, 
				getBounds(this),
				new Point(-MenuFactory.defaultPadding.x, -MenuFactory.defaultPadding.y)
			);
		}
		
	}

}
