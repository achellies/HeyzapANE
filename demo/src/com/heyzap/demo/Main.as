package com.heyzap.demo
{
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.events.StatusEvent;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import com.heyzap.extensions.Heyzap;
	
	public class Main extends Sprite 
	{		
		private var h : Heyzap;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;

			// Load heyzap and show the checkin screen
			h = new Heyzap();
			h.load(true, "123456", "mycoolscheme");

			// Add checkin button
			var txt : TextField = new TextField();
			txt.defaultTextFormat = new TextFormat('Verdana', 50, 0x000000);
			txt.text = "Check In!";
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.background = txt.border = true;
			txt.selectable = false;			
			var btn : Sprite = new Sprite();
			btn.mouseChildren = false;
			btn.addChild(txt);
			btn.buttonMode = true;			
			addChild(btn);		
			btn.addEventListener(MouseEvent.CLICK, function(event : MouseEvent) : void 
				{
					// Check in
					h.checkin("Example checkin text");
				});
		}
		
		private function deactivate(e:Event):void 
		{
			// NOTE: Do not quit the application, Heyzap.checkin() will also deactivate the app and thus quit it if you leave this line in
			// auto-close
			//NativeApplication.nativeApplication.exit();
		}
	}	
}
