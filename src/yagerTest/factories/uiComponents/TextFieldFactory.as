package yagerTest.factories.uiComponents 
{
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author gbiskup
	 */
	public class TextFieldFactory 
	{
		
		public static function createTextField(size:uint, bold:Boolean = true):TextField
		{
			var textField:TextField = new TextField();
			var format:TextFormat = new TextFormat();
            format.font = "Arial Bold";
            format.color = 0xaFFFFFF;
            format.size = size;
			format.bold = bold;
			textField.defaultTextFormat = format;
			textField.selectable = false;
			textField.autoSize = TextFieldAutoSize.LEFT;
			return textField;
		}
		
	}

}