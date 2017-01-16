package yagerTest.view.uiComponents 
{
	import flash.geom.Point;
	import flash.text.TextField;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.view.AlignDisplayObject;
	import yagerTest.view.ViewComponent;
	
	/**
	 * ...
	 * @author gbiskup
	 */
	public class HudLabel extends ViewComponent 
	{
		
		private var label:TextField;
		
		private var text:String = "DefaultText";
		private var value:int;
		
		private var parentAnchor:Point;
		private var offset:Point;
		
		public function HudLabel(parentAnchor:Point = null, offset:Point = null) 
		{
			super();
			this.parentAnchor = parentAnchor ? parentAnchor : new Point();
			this.offset = offset ? offset : new Point();
		}
		
		public function setValue(value:int):void
		{
			if (this.value != value)
			{
				this.value = value;
				updateLabel();
			}
		}
		
		public function setLabel(text:String):void
		{
			this.text = text;
			updateLabel();
		}
		
		override protected function init():void
		{
			label = TextFieldFactory.createTextField(35, true);
			addChild(label);
			updateLabel();
			updatePosition();
		}
		
		private function updatePosition():void
		{
			AlignDisplayObject.align(this, parentAnchor, parent.getBounds(parent), parentAnchor, offset);
		}
		
		private function updateLabel():void
		{
			if (label)
			{
				label.text = text + value;
				updatePosition();
			}
		}
		
	}

}