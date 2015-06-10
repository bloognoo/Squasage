package;

import Event;

class TouchInputEvent extends Event
{
	public var id:String = "";

	public function new( id:String )
	{
		super();
	
		this.id = id;
	}
}