package;

import openfl.events.Event;

class TouchInputEvent extends Event
{
	public var touchZone:TouchZone;

	public function new( touchZone:TouchZone, ?type, ?bubbles, ?cancelable )
	{
		super(type, bubbles, cancelable);

		this.touchZone = touchZone;
	}
}
