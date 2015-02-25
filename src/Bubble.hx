import starling.text.TextField;
import starling.utils.Color;
import starling.textures.Texture;
import starling.display.Sprite;
import starling.display.Image;
import flash.geom.Rectangle;
import starling.core.Starling;

class Bubble extends Sprite
{
	function new(tex:Texture, bubbleText:String)
	{		
		super();
		var bubbleImage = new Image(tex);
		this.addChild(bubbleImage);
		var bubbleTextContainer = new TextField(Std.int(this.width), Std.int(this.height), bubbleText, "serif", 40, Color.WHITE);
		this.addChild(bubbleTextContainer);
	}
}