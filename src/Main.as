package 
{
	import flash.display.*;
	import flash.events.FocusEvent;
	import flash.geom.Rectangle;
	import flash.text.ReturnKeyLabel;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	
	public class Main extends Sprite 
	{
		public var nativeText:NativeText;
		public var topTextField:RegularText;
		public var botTextField:RegularText;
		
		public function Main():void 
		{
			this.removeChildren();
			
			nativeText = new NativeText();
			nativeText.returnKeyLabel = ReturnKeyLabel.DONE;
			nativeText.autoCorrect = true;
			nativeText.fontSize = 40;
			nativeText.borderThickness = 1;
			nativeText.fontFamily = "Arial";
			nativeText.text = "This is native text.";
			nativeText.width = this.stage.stageWidth - (this.stage.stageWidth * .1);
			nativeText.visible = false;
			this.addChild(nativeText);
			
			topTextField = new RegularText(nativeText);
			topTextField.width = this.stage.stageWidth - (this.stage.stageWidth * .1);
			topTextField.height = nativeText.height;
			topTextField.x = (this.stage.stageWidth / 2) - (topTextField.width / 2);
			topTextField.y = (this.stage.stageHeight / 3) - (topTextField.height);
			topTextField.name = "Top";
			this.addChild(topTextField);
			
			botTextField = new RegularText(nativeText);
			botTextField.width = this.stage.stageWidth - (this.stage.stageWidth * .1);
			botTextField.height = nativeText.height;
			botTextField.x = (this.stage.stageWidth / 2) - (botTextField.width / 2);
			botTextField.y = (this.stage.stageHeight * 2 / 3) - (botTextField.height);
			botTextField.name = "Bottom";
			this.addChild(botTextField);
			
			nativeText.x = topTextField.x;
			nativeText.y = topTextField.y;
		}
	}
	
}