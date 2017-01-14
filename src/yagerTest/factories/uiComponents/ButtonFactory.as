package yagerTest.factories.uiComponents 
{
	import com.sibirjak.asdpc.button.Button;
	import com.sibirjak.asdpc.button.skins.ButtonSkin;
	import com.sibirjak.asdpc.textfield.Label;
	import flash.filters.GlowFilter;
	import yagerTest.view.uiComponents.MyButton;
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

			button.setStyle(ButtonSkin.style_border, true);
			button.setStyle(ButtonSkin.style_borderColors, [0xffeeee]);
			button.setStyle(ButtonSkin.style_backgroundColors, [0x000000]);
			button.setStyle(ButtonSkin.style_overBackgroundColors, [0x995555]);
		
			button.setStyle(Button.style.labelStyles, [
				Label.style.color, 0xEEEEEE,
				Label.style.size, 30,
				Label.style.font, "Arial Bold"
			]);
			button.setStyle(Button.style.overLabelStyles, [
				Label.style.color, 0x000000,
				Label.style.font, "Arial Bold",
				Label.style.size, 30
			]);
			button.setStyle(Button.style.selectedLabelStyles, [
				Label.style.color, 0xAAAAAA,
				Label.style.font, "Arial Bold",
				Label.style.size, 30
			]);
			button.filters = [new GlowFilter(0xffaaaa, 0.5, 4, 4, 2, 3, true), new GlowFilter(0xffaaaa, 0.5, 4, 4, 2, 3)];
			return button;
		}
	}

}