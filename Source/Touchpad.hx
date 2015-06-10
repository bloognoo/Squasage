package;

import openfl.events.EventDispatcher;

import openfl.events.TouchEvent;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;

import openfl.Lib;

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

	public function addTouchZone( touchZone:TouchZone )
	{
		if(touchZone != null)
		{
			touchZones.add(touchZone);
		}	
	}

	private function onTouchBegin( event:TouchEvent )
	{

	}

	private function onTouchMove( event:TouchEvent )
	{

	}

	private function onTouchEnd( event:TouchEvent )
	{

	}

		//dispatchEvent(new TouchInputEvent(id));
}