import starling.text.TextField;
import starling.utils.Color;
import starling.textures.Texture;
import starling.display.Sprite;
import starling.display.Image;
import flash.geom.Rectangle;
import starling.core.Starling;
import starling.events.EnterFrameEvent;

class Bubble extends Sprite
{
	private var deltaSpeed:Int = 0;
	private var deltaX:Int = 0;
	private var deltaY:Int = 0;
	private var randomBound:Int = 5;

	function new(tex:Texture, bubbleText:String, deltaSpeed:Int)
	{		
		super();
		this.deltaSpeed = deltaSpeed;
		var bubbleImage = new Image(tex);
		this.addChild(bubbleImage);
		var bubbleTextContainer = new TextField(Std.int(this.width), Std.int(this.height), bubbleText, "serif", 40, Color.WHITE);
		this.addChild(bubbleTextContainer);

        this.setRandomValues();

		this.addEventListener(EnterFrameEvent.ENTER_FRAME, function(event:EnterFrameEvent) {
			updatePosition();
			});
	}

	function updatePosition()
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