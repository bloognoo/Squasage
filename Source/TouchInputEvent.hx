package;

import Event;

class TouchInputEvent extends Event
{
	public var touchZone:TouchZone;

	public function new( touchZone:TouchZone )
	{
		super();

		this.touchZone = touchZone;
	}
}
