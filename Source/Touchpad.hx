package;

import openfl.display.Sprite;
import openfl.events.EventDispatcher;
import openfl.events.TouchEvent;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;

import openfl.Lib;

class Touchpad extends EventDispatcher
{
	private var touchZones:List<TouchZone>;

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

		touchZones = new List<TouchZone>();
	}

	public function addTouchZone( touchZone:TouchZone )
	{
		if(touchZone != null)
		{
			touchZones.add(touchZone);
		}
	}

	private function collided( x:Float, y:Float, target:TouchZone ):Bool
	{
		if( x > target.x && x < target.x + target.width )
		{
			if( y > target.y && y < target.y + target.height )
			{
				return true;
			}
		}
		return false;
	}

	private function testZones( event:TouchEvent, state:Int )
	{
		var x = event.stageX;
		var y = event.stageY;

		for( zone in touchZones )
		{
			if( collided( event.stageX, event.stageY, zone) )
			{
				zone.touchState = state;
				dispatchEvent( new TouchInputEvent( zone ) );
			}
		}
	}

	private function onTouchBegin( event:TouchEvent )
	{
		testZones( event, TouchState.Begin );
	}

	private function onTouchMove( event:TouchEvent )
	{
		testZones( event, TouchState.Move );
	}

	private function onTouchEnd( event:TouchEvent )
	{
		testZones( event, TouchState.End );
	}
}
