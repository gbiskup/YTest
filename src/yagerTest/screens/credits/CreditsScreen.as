package yagerTest.screens.credits 
{
	import flash.text.TextField;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.screens.BasicScreen;
	import yagerTest.view.DisplayObjectAlign;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class CreditsScreen extends BasicScreen
	{
		public function CreditsScreen() 
		{
			super();
			
		}
		
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
			DisplayObjectAlign.center(nameTextField, stage.getBounds(stage));
		}
		
		private function initBackButton():void
		{
			
		}
		
	}

}