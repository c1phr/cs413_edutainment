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

class Credits extends Sprite
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

		var ryanBatchelder = new TextField(600, 100, "Ryan Batchelder", "font", 50, Color.WHITE);
		ryanBatchelder.x = Std.int(stage.stageWidth/2) - 300;
		ryanBatchelder.y = 100;
		addChild(ryanBatchelder);

		var ryanDooley = new TextField(400, 100, "Ryan Dooley", "font", 50, Color.WHITE);
		ryanDooley.x = Std.int(stage.stageWidth/2) - 200;
		ryanDooley.y = 200;
		addChild(ryanDooley);

		var andrewHodel = new TextField(400, 100, "Andrew Hodel", "font", 50, Color.WHITE);
		andrewHodel.x = Std.int(stage.stageWidth/2) - 200;
		andrewHodel.y = 300;
		addChild(andrewHodel);

		var johnLoudon = new TextField(400, 100, "John Loudon", "font", 50, Color.WHITE);
		johnLoudon.x = Std.int(stage.stageWidth/2) - 200;
		johnLoudon.y = 400;
		addChild(johnLoudon);

		var brianSaganey = new TextField(400, 100, "Brian Saganey", "font", 50, Color.WHITE);
		brianSaganey.x = Std.int(stage.stageWidth/2) - 200;
		brianSaganey.y = 500;
		addChild(brianSaganey);

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