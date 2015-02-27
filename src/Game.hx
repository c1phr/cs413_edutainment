import Math.*;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.utils.RectangleUtil;
import starling.utils.MathUtil;
import flash.media.Sound;
import flash.media.SoundChannel;
import haxe.Timer;

class Game extends Sprite
{

	var rootSprite:Sprite;
	public var bubble1:Bubble;

	public function new(rootSprite)
	{

		super();
		this.rootSprite = rootSprite;

	}

	public function startGame()
	{

		var timer = new haxe.Timer(2000);
		timer.run = addBubble;

	}

	public function addBubble()
	{
		var height:Float = random() * 400;

		bubble1 = new Bubble(Root.assets.getTexture("bubble1"),"Some Number", 1, false);
		addChild(bubble1);
		bubble1.x = 1400;
		bubble1.y = 100 + height;

	}

}