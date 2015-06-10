package;

import openfl.events.EventDispatcher;

import openfl.events.TouchEvent;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;

class Touchpad extends EventDispatcher
{
	public function new()
	{
		super();
		var touchEnabled = Multitouch.supportsTouchEvents;
		if(touchEnabled)
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
	
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_MOVE, onTouchMove);
			Lib.current.stage.addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
		}
	}




		//dispatchEvent(new TouchInputEvent(id));
}