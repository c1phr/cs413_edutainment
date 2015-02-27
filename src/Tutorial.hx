import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.display.Quad;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.events.Event;

class Tutorial extends Sprite
{
	function new()
	{
		super();

		var stage = Starling.current.stage;

		this.width = stage.stageWidth;
		this.height = stage.stageHeight;
		var background = new Quad(stage.stageWidth, stage.stageHeight, 0x91D3FF);
		addChild(background);

		var title:TextField = new TextField(stage.stageWidth, 400, "Bubble Math", "font", 96, Color.WHITE);
		title.x = 0;
		title.y = -150;
		addChild(title);

		var instructionsText:String = "Click bubbles to select numbers that are factors of the number displayed at the top\n\n";

		var instructions = new TextField(1200, 600, instructionsText, "font", 42, Color.WHITE);
		instructions.x = Std.int(stage.stageWidth/2) - 600;
		instructions.y = 0;
		addChild(instructions);

		var backButton = new TextField(400, 100, "Back", "font", 72, Color.WHITE);
		backButton.x = Std.int(stage.stageWidth/2) - 200;
		backButton.y = 600;
		backButton.border = true;
		backButton.addEventListener(TouchEvent.TOUCH, backToMenu);

		addChild(backButton);
	}

	public function backToMenu(event:TouchEvent)
	{
		var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
		if (touch != null)
		{
			this.removeFromParent();
			this.dispose();
		}
	}
}