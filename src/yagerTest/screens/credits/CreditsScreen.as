package yagerTest.screens.credits 
{
	import flash.geom.Point;
	import flash.text.TextField;
	import yagerTest.factories.animations.AnimationFactory;
	import yagerTest.factories.uiComponents.ButtonFactory;
	import yagerTest.factories.uiComponents.MenuFactory;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import yagerTest.view.utilities.AlignDisplayObject;
	import yagerTest.view.uiComponents.button.MyButton;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class CreditsScreen extends BasicScreen
	{
		override protected function init():void
		{
			super.init();
			initNameTextField();
			initBackButton();
		}
		
		private function initNameTextField():void
		{
			var nameTextField:TextField = TextFieldFactory.createTextField(40);
			nameTextField.text = "Programmed by Grzegorz Biskup";
			addChild(nameTextField);
			AnimationFactory.createShowAnimation(nameTextField);
			AlignDisplayObject.center(nameTextField, getBounds(this));
		}
		
		private function initBackButton():void
		{
			var backButton:MyButton = ButtonFactory.createTextButton("Back", exitScreen);
			addChild(backButton);
			AnimationFactory.createShowAnimation(backButton);
			AlignDisplayObject.rightBottom(
				backButton, 
				getBounds(this),
				new Point(-MenuFactory.defaultPadding.x, -MenuFactory.defaultPadding.y)
			);
		}
		
	}

}