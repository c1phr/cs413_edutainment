import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.display.Quad;

class Tutorial extends Sprite {		
	public function new()
	{
		super();
		var stage = Starling.current.stage;

		this.width = stage.stageWidth;
		this.height = stage.stageHeight;
		var background = new Quad(stage.stageWidth, stage.stageHeight, Color.BLACK);
		addChild(background);

		var title:TextField = new TextField(stage.stageWidth, 400, "The Room", "title_font", 96, Color.WHITE);
		title.x = 0;
		title.y = -150;
		addChild(title);

		var instructionsText:String = "Find all the keys to escape the room, but watch out for surprises!\n\n"
		+ "Use the arrow keys to move and the Enter key to interact.\n\n\n\n"
		+ "Good luck...";

		var instructions = new TextField(1200, 600, instructionsText, "title_font", 42, Color.WHITE);
		instructions.x = Std.int(stage.stageWidth/2) - 600;
		instructions.y = 0;
		addChild(instructions);


		var backButton = new TextField(400, 100, "Back", "title_font", 72, Color.WHITE);
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