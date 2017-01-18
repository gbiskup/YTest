package yagerTest.view.uiComponents 
{
	import flash.geom.Point;
	import flash.text.TextField;
	import yagerTest.factories.uiComponents.TextFieldFactory;
	import yagerTest.view.basicViewComponent.ViewComponent;
	import yagerTest.view.utilities.AlignDisplayObject;
	
	/**
	 * Displays a text label and a value. After adding to stage it will align it's anchor point in relation to stage and apply offset if given.
	 * @author gbiskup
	 */
	public class HudLabel extends ViewComponent 
	{
		private var label:TextField;
		
		private var text:String = "DefaultText";
		private var value:int;
		
		private var alignAnchor:Point;
		private var offset:Point;
		
		public function HudLabel(alignAnchor:Point = null, offset:Point = null)
		{
			super();
			this.alignAnchor = alignAnchor ? alignAnchor : new Point();
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
		
		override protected function constructChildren():void
		{
			super.constructChildren();
			label = TextFieldFactory.createTextField(35, true);
			addChild(label);
		}
		
		override protected function init():void
		{
			super.init();
			updateLabel();
			updatePosition();
		}
		
		private function updatePosition():void
		{
			AlignDisplayObject.align(this, alignAnchor, stage.getBounds(stage), alignAnchor, offset);				
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
