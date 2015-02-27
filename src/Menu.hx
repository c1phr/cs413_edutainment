import starling.display.Sprite;
import starling.text.TextField;
import starling.text.BitmapFont;
import starling.core.Starling;
import starling.utils.Color;
import starling.events.TouchEvent;
import starling.events.Touch;
import starling.events.TouchPhase;
import starling.events.Event;
import starling.events.EnterFrameEvent;
import flash.geom.Point;

class Menu extends Sprite 
{
    public var rootSprite:Sprite;
    private var bubbles:List<Bubble> = new List<Bubble>();

    public function new(rootSprite:Sprite)
    {
        super();
        this.rootSprite = rootSprite;
        
        var startGameBubble = new Bubble(Root.assets.getTexture("bubble2"), "Start Game", 1, true);
        startGameBubble.x = 100;
        startGameBubble.y = 200;
        startGameBubble.addEventListener(TouchEvent.TOUCH, startGame);
        addChild(startGameBubble);
        bubbles.add(startGameBubble);


        var tutorialBubble = new Bubble(Root.assets.getTexture("bubble1"), "Tutorial", 1, true);
        tutorialBubble.x = 500;
        tutorialBubble.y = 200;
        tutorialBubble.addEventListener(TouchEvent.TOUCH, openTutorial);
        addChild(tutorialBubble);
        bubbles.add(tutorialBubble);       

        var creditsBubble = new Bubble(Root.assets.getTexture("bubble3"), "Credits", 1, true);
        creditsBubble.x = 900;
        creditsBubble.y = 200;
        creditsBubble.addEventListener(TouchEvent.TOUCH, openCredits);
        addChild(creditsBubble);
        bubbles.add(creditsBubble);    

        this.addEventListener("bubbleEvent", function(e:Event) {
            trace(e.data.value);
        });
        this.addEventListener(EnterFrameEvent.ENTER_FRAME, function(event:EnterFrameEvent) {
            for (bubble in bubbles)
            {
                for (otherBubble in bubbles)
                {                    
                    if (otherBubble != bubble)
                    {                        
                        if (checkCollision(bubble, otherBubble))
                        {                                                  
                            bubble.invertDeltas();
                            //otherBubble.invertDeltas();
                        }
                    }
                }
            }
        });

    }

    private function checkCollision(bubble1:Bubble, bubble2:Bubble):Bool
    {
        var distance = Point.distance(bubble1.centerPoint, bubble2.centerPoint);        
        if (distance < bubble1.radius + bubble2.radius)
        {            
            return true;
        }
        return false;
    }

    public function startGame(event:TouchEvent)
    {

        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if(touch != null)
        {

            var game = new Game(rootSprite);
            rootSprite.addChild(game);
            game.startGame();
            this.removeFromParent();
            this.dispose();

        }

    }

    public function openCredits(event:TouchEvent)
    {

        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch != null)
        {

            var creditsScreen = new Credits();
            addChild(creditsScreen);

        }

    }

    public function openTutorial(event:TouchEvent)
    {

        var touch:Touch = event.getTouch(this, TouchPhase.ENDED);
        if (touch != null)
        {

            var tutorialScreen = new Tutorial();
            addChild(tutorialScreen);

        }

    }
}