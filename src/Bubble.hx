import starling.text.TextField;
import starling.utils.Color;
import starling.textures.Texture;
import starling.display.Sprite;
import starling.display.Image;
import flash.geom.Rectangle;
import starling.core.Starling;
import starling.events.EnterFrameEvent;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;

class Bubble extends Sprite
{
	private var deltaSpeed:Int = 0;
	private var deltaX:Int = 0;
	private var deltaY:Int = 0;
	private var randomBound:Int = 5;
	private var isMenu:Bool;
	private var bubbleText:String;

	function new(tex:Texture, bubbleText:String, deltaSpeed:Int, isMenu:Bool)
	{		
		super();
		this.deltaSpeed = deltaSpeed;
		this.isMenu = isMenu;
		this.bubbleText = bubbleText;
		var bubbleImage = new Image(tex);
		this.addChild(bubbleImage);
		var bubbleTextContainer = new TextField(Std.int(this.width), Std.int(this.height), bubbleText, "serif", 40, Color.WHITE);
		this.addChild(bubbleTextContainer);

		if (this.isMenu)
		{
			this.setRandomValues();
		}        
		else
		{
			// Move bubbles differently when in the actual game
		}

		this.addEventListener(EnterFrameEvent.ENTER_FRAME, function(event:EnterFrameEvent) {
			updatePosition();
		});

		this.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent) {
			var touch = e.getTouch(stage, TouchPhase.ENDED);
	        if (touch != null)
	        {
	        	// Do stuff with numbers
	            trace(bubbleText);
	        } 
		});
	}

	function updatePosition()
	{
		if (this.isMenu)
		{
			this.x += this.deltaX;
			this.y += this.deltaY;

			if (this.x < 0 || this.x > (Starling.current.stage.stageWidth - this.width))
			{
				this.deltaX *= -1;
			}
			if (this.y < 0 || this.y > (Starling.current.stage.stageHeight - this.height))
			{			
				this.deltaY *= -1;
			}
		}
		else
		{
			// Move the bubbles differently for when in the game itself
		}
		
	}

	function setRandomValues()
	{
        // Randomly determine a movement speed
        this.deltaX = Std.random(this.randomBound) * this.deltaSpeed;
        this.deltaY = Std.random(this.randomBound) * this.deltaSpeed;

        if (Std.random(2) == 1)
        {
            this.deltaX *= -1;
        }
        if (Std.random(2) == 1)
        {
            this.deltaY *= -1;
        }       
	}
}