package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	public class RegularText extends Sprite 
	{
		private var _textField:TextField;
		private var _nativeText:NativeText;
		private var _name:String;
		
		public function RegularText(nativeText:NativeText) 
		{
			super();
			_textField = new TextField();
			_textField.type = TextFieldType.INPUT;
			_textField.defaultTextFormat = new TextFormat("Arial", 40);
			_textField.border = true;
			_textField.borderColor = 0x000000;
			_textField.text = "This is regular text field";
			_nativeText = nativeText;
			this.addChild(_textField);
			this.addEventListener(Event.ADDED_TO_STAGE, addListeners);
		}
		
		override public function get name():String 
		{
			return _name;
		}
		
		override public function set name(value:String):void 
		{
			_name = value;
		}
		
		override public function get width():Number 
		{
			return _textField.width;
		}
		
		override public function set width(value:Number):void 
		{
			_textField.width = value;
		}
		
		override public function get height():Number 
		{
			return _textField.height;
		}
		
		override public function set height(value:Number):void 
		{
			_textField.height = value;
		}
		
		override public function get x():Number 
		{
			return _textField.x;
		}
		
		override public function set x(value:Number):void 
		{
			_textField.x = value;
		}
		
		override public function get y():Number 
		{
			return _textField.y;
		}
		
		override public function set y(value:Number):void 
		{
			_textField.y = value;
		}
		
		public function addListeners(event:Event):void
		{
			_textField.addEventListener(FocusEvent.FOCUS_IN, onTextFieldFocusIn);
		}
		
		private function onTextFieldFocusIn(e:FocusEvent):void 
		{
			trace("=== " + _name + " FOCUS IN ===");
			_nativeText.x = _textField.x;
			_nativeText.y = _textField.y
			_nativeText.text = _textField.text;
			
			_textField.visible = false;
			_textField.removeEventListener(FocusEvent.FOCUS_IN, onTextFieldFocusIn);
			_textField.stage.focus = null;
			
			_nativeText.visible = true;
			_nativeText.assignFocus();
			_nativeText.addEventListener(FocusEvent.FOCUS_OUT, onNativeTextFocusOut);
			_nativeText.addEventListener(Event.CHANGE, updateTextFromStageText);
			
			printCurrentFocus();
		}
		
		private function onNativeTextFocusOut(e:FocusEvent):void 
		{
			trace("=== StageText FOCUS OUT ===");
			_textField.visible = true;
			_textField.addEventListener(FocusEvent.FOCUS_IN, onTextFieldFocusIn);
			
			_nativeText.visible = false;
			_nativeText.removeEventListener(FocusEvent.FOCUS_OUT, onNativeTextFocusOut);
			_nativeText.removeEventListener(Event.CHANGE, updateTextFromStageText);
			
			printCurrentFocus();
		}
		
		private function updateTextFromStageText(e:Event):void 
		{
			_textField.text = _nativeText.text;
		}
		
		private function printCurrentFocus():void
		{
			var printString:String = "Current focus on:\t";
			if (stage.focus == null)
			{
				printString += "NONE";
			}
			else if (stage.focus == _textField)
			{
				printString += _name;
			}
			else
			{
				printString += stage.focus.name;
			}

			trace(printString);
		}
	}

}