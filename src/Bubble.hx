import starling.text.TextField;
import starling.utils.Color;
import starling.textures.Texture;
import starling.display.Sprite;
import starling.display.Image;
import flash.geom.Point;
import starling.core.Starling;
import starling.events.EnterFrameEvent;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.events.Event;

class Bubble extends Sprite
{
	private var deltaSpeed:Int = 0;
	private var deltaX:Int = 0;
	private var deltaY:Int = 0;
	private var randomBound:Int = 5;
	private var isMenu:Bool;
	private var bubbleText:String;
	public var centerPoint:Point;
	public var radius:Float;

	function new(tex:Texture, bubbleText:String, deltaSpeed:Int, isMenu:Bool)
	{		
		super();
		this.deltaSpeed = deltaSpeed;
		this.isMenu = isMenu;
		this.bubbleText = bubbleText;
		var bubbleImage = new Image(tex);
		this.addChild(bubbleImage);		
		this.radius = this.height/2;		
		var bubbleTextContainer = new TextField(Std.int(this.width), Std.int(this.height), bubbleText, "font", 40, Color.WHITE);
		this.addChild(bubbleTextContainer);
		this.centerPoint = new Point(this.x, this.y);

		if (this.isMenu)
		{
			this.setRandomValues();
		}        
		else
		{
			this.setRandomValues();
			updatePosition();
			// Move bubbles differently when in the actual game
		}

		this.addEventListener(EnterFrameEvent.ENTER_FRAME, function(event:EnterFrameEvent) {
			updatePosition();
		});

		this.addEventListener(TouchEvent.TOUCH, function(e:TouchEvent) {
			var touch = e.getTouch(stage, TouchPhase.ENDED);
	        if (this.isMenu && touch != null)
	        {	        	
	        	dispatchEventWith("bubbleEvent", true, {value: this.bubbleText});
	        } 
	        if (!this.isMenu && touch != null)
	        {
	        	dispatchEventWith("bubbleEvent", true, {  value: Std.parseInt(this.bubbleText) });
	        } 
		});
	}

	function updatePosition()
	{
		if (this.isMenu)
		{
			this.x += this.deltaX;
			this.centerPoint.x = this.x;
			this.y += this.deltaY;
			this.centerPoint.y = this.y;

			
		}
		else
		{
			this.x -= this.deltaX;
			this.y -= this.deltaY;
		}		
		if (this.x < 0 || this.x > (Starling.current.stage.stageWidth - this.width))
			{
				this.deltaX *= -1;
			}
			if (this.y < 0 || this.y > (Starling.current.stage.stageHeight - this.height))
			{			
				this.deltaY *= -1;
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

	public function invertDeltas()
	{		
		this.deltaX *= -1;
		this.deltaY *= -1;		
	}
}