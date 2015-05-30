package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.Lib;
import openfl.ui.Keyboard;
import haxe.ds.IntMap;

class Squashy extends Sprite
{
    public var seg:SquashySeg;
    private var keys:IntMap<Bool>;
    public var j1=0;
    public var j2=0;
    public var j3=0;

    public function new( playerController:Bool = false)
    {
        super();

        name = "squashy";

        var curSeg = null;
        var nxtSeg = null;
        
        keys = new IntMap<Bool>();
        keys.set(Keyboard.Q,false);
        keys.set(Keyboard.W,false);
        keys.set(Keyboard.E,false);
        keys.set(Keyboard.R,false);
        keys.set(Keyboard.P,false);
        keys.set(Keyboard.O,false);
        keys.set(Keyboard.I,false);
        keys.set(Keyboard.U,false);

        for( i in 0...4 )
        {
            nxtSeg = new SquashySeg(i==3?true:false);
            
            if(i==1) { nxtSeg.leftDisplay.text="E"; nxtSeg.rightDisplay.text="I"; }
            if(i==2) { nxtSeg.leftDisplay.text="W"; nxtSeg.rightDisplay.text="O"; }
            if(i==3) { nxtSeg.leftDisplay.text="Q"; nxtSeg.rightDisplay.text="P"; }
            
            nxtSeg.y = -50;
            
            if( curSeg != null )
            {
                curSeg.addChild(nxtSeg);
            }
            else
            {
                seg = nxtSeg;
            }
            if(playerController) nxtSeg.addChild(nxtSeg.leftDisplay);
            if(playerController) nxtSeg.addChild(nxtSeg.rightDisplay);
            curSeg = nxtSeg;
        }
        addChild(seg);

        if(playerController)
        {
            Lib.current.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDown );
            Lib.current.stage.addEventListener( KeyboardEvent.KEY_UP, onKeyUp );
            Lib.current.stage.addEventListener( Event.ENTER_FRAME, onFrame );
        }
    }

    public function randomShape()
    {
        j1 = randomJoint(seg.child);
        j2 = randomJoint(seg.child.child);
        j3 = randomJoint(seg.child.child.child);
    }

    private function randomJoint( joint )
    {
        var rand = Math.random();
        if(rand >= 0.6){ joint.left(); return -1; }
        else if(rand >= 0.3){ joint.straight(); return 0; }
        else { joint.right(); return 1; }
    }

    private function onKeyUp( event:KeyboardEvent )
    {
        keys.set(event.keyCode,false);
    }

    private function onKeyDown( event:KeyboardEvent )
    {
        keys.set(event.keyCode,true);
    }

    private function onFrame( event:Event )
    {
        var q = keys.get(Keyboard.Q);
        var w = keys.get(Keyboard.W);
        var e = keys.get(Keyboard.E);
        
        var i = keys.get(Keyboard.P);
        var o = keys.get(Keyboard.O);
        var p = keys.get(Keyboard.I);

        if(q){ seg.child.child.child.left(); j3=-1; }
        else if (i){ seg.child.child.child.right(); j3=1; }
        else {seg.child.child.child.straight(); j3 = 0; }

        if(w){ seg.child.child.left(); j2=-1; }
        else if (o){ seg.child.child.right(); j2=1; }
        else {seg.child.child.straight(); j2 = 0; }

        if(e){ seg.child.left(); j1=-1; }
        else if (p){ seg.child.right(); j1=1; }
        else{ seg.child.straight(); j1=0; }
    }
}
