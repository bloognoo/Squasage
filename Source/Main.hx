package;

import haxe.Timer;

import openfl.display.Sprite;
import openfl.text.Font;
import openfl.text.TextField;
import openfl.text.TextFormat;

import motion.Actuate;

class Main extends Sprite {

	private var countdown:TextField;
	private var timerMax = 5;
	private var timerCount = 6;
	private var dancer:Squashy = new Squashy();
	private var squashy:Squashy = new Squashy(true);
	private var livesMax = 5;
	private var lives = 5;
	private var playerScore = 0;

	private var livesDisplay:TextField;
	private var scoreDisplay:TextField;

	public function new () {

		super ();

		var topFormat = new TextFormat ("Katamotz Ikasi", 45, 0x7A0026);
		livesDisplay = new TextField();
		livesDisplay.defaultTextFormat = topFormat;
		livesDisplay.embedFonts = true;
		livesDisplay.selectable = false;
		livesDisplay.width = 200;
		livesDisplay.x = 400;
		livesDisplay.y = -10;
		addChild(livesDisplay);
		updateLives();
		scoreDisplay = new TextField();
		scoreDisplay.defaultTextFormat = topFormat;
		scoreDisplay.embedFonts = true;
		scoreDisplay.width = 200;
		scoreDisplay.x = 60;
		scoreDisplay.y = -10;
		addChild(scoreDisplay);
		updateScore();

		var format = new TextFormat ("Katamotz Ikasi", 90, 0x7A0026);
		var textField = new TextField ();
		textField.defaultTextFormat = format;
		textField.embedFonts = true;
		textField.selectable = false;
		textField.x = 50;
		textField.y = 40;
		textField.width = 200;
		textField.text = "Squashage";

		countdown = new TextField();
		countdown.defaultTextFormat = format;
		countdown.embedFonts = true;
		countdown.selectable = false;
		countdown.x = 580;
		countdown.y = 20;
		countdown.width = 100;
		countdown.text = "0";

		addChild (textField);
		addChild (countdown);

		graphics.beginFill();
		graphics.lineStyle(2,0x9A2046,0.5);
		graphics.moveTo(600,200);
		graphics.lineTo(600,480);

		graphics.moveTo(460,360);
		graphics.lineTo(740,360);

		graphics.moveTo(200,200);
		graphics.lineTo(200,480);

		graphics.moveTo(60,360);
		graphics.lineTo(340,360);
		graphics.endFill();

		squashy.x = 200;
		squashy.y = 400;
		addChild(squashy);

		dancer.x = 600;
		dancer.y = 400;
		addChild(dancer);

		lives = livesMax;

		trigger();
	}

	private function updateScore()
	{
		var digits = ""+playerScore;
		var out = "";
		var diff = 10 - digits.length;
		for( i in 0...diff )
		{
			out += "0";
		}
		scoreDisplay.text = out+playerScore;
	}

	private function updateLives()
	{
		var out = "[ ";
		for( i in 0...lives)
		{
			out += "*";
		}
		for( i in 0...(livesMax-lives) )
		{
			out += " ";
		}
		livesDisplay.text = out+"]";
	}

	private function trigger()
	{
		timerCount--;
		if( timerCount == -1)
		{
			timerCount = timerMax;
			dancer.randomShape();
		}
		countdown.text = ""+timerCount;
		if(timerCount == 0)
		{
			var tempScore = score(squashy,dancer);
			if(tempScore == 0)
			{
				lives --;
			}

			if( lives == 0 )
			{
				lives = livesMax;
				playerScore = 0;
			}
			else
			{
				playerScore += tempScore;
			}
		}

		updateScore();
		updateLives();

		Actuate.timer (1).onComplete(trigger);
	}

	private function score(sq1:Squashy, sq2:Squashy)
	{
		if( sq1.j0 == sq2.j0 &&
			sq1.j1 == sq2.j1 &&
			sq1.j2 == sq2.j2 ) return 6;
		return 0;
	}
}