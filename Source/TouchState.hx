package;

typedef TouchStateValue = Int;

class TouchState
{
	public static var None:TouchStateValue = 0;
	public static var Begin:TouchStateValue = 1;
	public static var End:TouchStateValue = 2;
	public static var Move:TouchStateValue = 3;
}
