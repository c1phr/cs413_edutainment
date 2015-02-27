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

class Game extends Sprite
{

	var rootSprite:Sprite;
	public var bubble1:Image;

	public function new(rootSprite)
	{

		super();
		this.rootSprite = rootSprite;

	}

	public function startGame()
	{

		bubble1 = new Image(Root.assets.getTexture("bubble1"));
		addChild(bubble1);
		bubble1.x = 600;
		bubble1.y = 350;

	}

}