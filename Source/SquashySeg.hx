package;

import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFormat;
import lime.math.Vector2;
import openfl.events.Event;

import motion.Actuate;

class SquashySeg extends Sprite
{
    public var leftDisplay = new TextField();
    public var rightDisplay = new TextField();


  public function new( colour:Int )
  {
    super();

    name = "seg";

    graphics.beginFill(colour);
    graphics.drawRect(-20,-20,40,40);
    graphics.endFill();

    var format = new TextFormat ("Katamotz Ikasi", 25, 0xCC0026);
    leftDisplay.defaultTextFormat = format;
    leftDisplay.embedFonts = true;
    leftDisplay.selectable = false;
    leftDisplay.width = 20;
    leftDisplay.x = -40;
    leftDisplay.y = -20;
    leftDisplay.name="left";

    rightDisplay.defaultTextFormat = format;
    rightDisplay.embedFonts = true;
    rightDisplay.selectable = false;
    rightDisplay.width = 20;
    rightDisplay.x = 25;
    rightDisplay.y = -20;
  }

  public function right()
  {
    Actuate.tween(this, 0.5, { rotation:90 }, false);
  }

  public function left()
  {
    Actuate.tween(this, 0.5, { rotation:-90 }, false);
  }

  public function straight()
  {
      Actuate.tween(this, 0.5, { rotation:0 }, false);
  }

  public var child(get,null):SquashySeg;

  private function get_child()
  {
      return cast(this.getChildByName("seg"),SquashySeg);
  }
}
