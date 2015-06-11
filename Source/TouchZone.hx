package;

enum TouchState
{
	Begin;
	End;
	Move;
}

class TouchZone
{
	public var x:Float;
	public var y:Float;
	public var value:String;
	public var state:Enum<TouchState>;
}
