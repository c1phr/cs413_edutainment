import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;

class Menu extends Sprite 
{
    public var rootSprite:Sprite;

    public function new(rootSprite:Sprite)
    {
        super();
        this.rootSprite = rootSprite;
        
        var startGameBubble = new Bubble(Root.assets.getTexture("bubble2"), "Start Game");
        startGameBubble.x = 100;
        startGameBubble.y = 200;
        addChild(startGameBubble);
        startGameBubble.addEventListener(TouchEvent.TOUCH, startGame);

        var tutorialBubble = new Bubble(Root.assets.getTexture("bubble1"), "Tutorial");
        tutorialBubble.x = 500;
        tutorialBubble.y = 200;
        addChild(tutorialBubble);
        tutorialBubble.addEventListener(TouchEvent.TOUCH, startTutorial);

        var creditsBubble = new Bubble(Root.assets.getTexture("bubble3"), "Credits");
        creditsBubble.x = 900;
        creditsBubble.y = 200;
        addChild(creditsBubble);
        creditsBubble.addEventListener(TouchEvent.TOUCH, startCredits);
    }

    private function startGame(e:TouchEvent):Void
    {
        var touch = e.getTouch(stage, TouchPhase.ENDED);
        if (touch != null)
        {
            // Start the game
        }       
    }

    private function startTutorial(e:TouchEvent):Void
    {
        var touch = e.getTouch(stage, TouchPhase.ENDED);
        if (touch != null)
        {
            // Start the tutorial
        }       
    }

    private function startCredits(e:TouchEvent):Void
    {
        var touch = e.getTouch(stage, TouchPhase.ENDED);
        if (touch != null)
        {
            // Start the credits
        }       
    }
}