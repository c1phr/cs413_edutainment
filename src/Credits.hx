import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.display.Quad;

class Credits extends Sprite {		
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

		var ryanBatchelder = new TextField(600, 100, "Ryan Batchelder", "title_font", 50, Color.WHITE);
		ryanBatchelder.x = Std.int(stage.stageWidth/2) - 300;
		ryanBatchelder.y = 100;
		addChild(ryanBatchelder);

		var ryanDooley = new TextField(400, 100, "Ryan Dooley", "title_font", 50, Color.WHITE);
		ryanDooley.x = Std.int(stage.stageWidth/2) - 200;
		ryanDooley.y = 200;
		addChild(ryanDooley);

		var andrewHodel = new TextField(400, 100, "Andrew Hodel", "title_font", 50, Color.WHITE);
		andrewHodel.x = Std.int(stage.stageWidth/2) - 200;
		andrewHodel.y = 300;
		addChild(andrewHodel);

		var johnLoudon = new TextField(400, 100, "John Loudon", "title_font", 50, Color.WHITE);
		johnLoudon.x = Std.int(stage.stageWidth/2) - 200;
		johnLoudon.y = 400;
		addChild(johnLoudon);

		var brianSaganey = new TextField(400, 100, "Brian Saganey", "title_font", 50, Color.WHITE);
		brianSaganey.x = Std.int(stage.stageWidth/2) - 200;
		brianSaganey.y = 500;
		addChild(brianSaganey);


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