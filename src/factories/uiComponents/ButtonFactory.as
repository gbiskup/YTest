package factories.uiComponents 
{
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.button.skins.ButtonSkin;
	import com.sibirjak.asdpc.textfield.Label;
	import view.uiComponents.MyButton;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class ButtonFactory
	{
		public static function createTextButton(text:String, callback:Function):MyButton
		{
			var button:MyButton = new MyButton(callback);

			button.setSize(300, 30);
			button.label = text;

			button.setStyle(ButtonSkin.style_backgroundAlpha, 0.0);
			button.setStyle(ButtonSkin.style_borderColors, [0xFFAAAA]);
			button.setStyle(ButtonSkin.style_border, 2);
			button.setStyle(ButtonSkin.style_borderAlias, 5);

			button.setStyle(Button.style.labelStyles, [
				Label.style.color, 0xEEEEEE,
				Label.style.size, 20,
				Label.style.font, "Arial"
			]);
			button.setStyle(Button.style.overLabelStyles, [
				Label.style.color, 0xFFFFFF,
				Label.style.font, "Arial",
				Label.style.size, 30
			]);
			button.setStyle(Button.style.selectedLabelStyles, [
				Label.style.color, 0xAAAAAA,
				Label.style.font, "Arial",
				Label.style.size, 25
			]);
			return button;
		}
	}

}