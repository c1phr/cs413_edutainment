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
import flash.media.SoundChannel;

class Menu extends Sprite 
{
    public var rootSprite:Sprite;
    private var bubbles:List<Bubble> = new List<Bubble>();

    public function new(rootSprite:Sprite)
    {
        super();
        var menuMusic:SoundChannel = Root.assets.playSound("Beats");
        this.rootSprite = rootSprite;
        var stage = Starling.current.stage;

        var title:TextField = new TextField(stage.stageWidth, 400, "Bubble Math", "font", 96, Color.WHITE);
        title.x = 0;
        title.y = -150;
        addChild(title);
        
        var startGameBubble = new Bubble(Root.assets.getTexture("bubble2"), "Start Game", 1, true);
        startGameBubble.x = 100;
        startGameBubble.y = 200;
        addChild(startGameBubble);
        bubbles.add(startGameBubble);

        var tutorialBubble = new Bubble(Root.assets.getTexture("bubble1"), "Tutorial", 1, true);
        tutorialBubble.x = 500;
        tutorialBubble.y = 200;
        addChild(tutorialBubble);
        bubbles.add(tutorialBubble);       

        var creditsBubble = new Bubble(Root.assets.getTexture("bubble3"), "Credits", 1, true);
        creditsBubble.x = 900;
        creditsBubble.y = 200;
        addChild(creditsBubble);
        bubbles.add(creditsBubble);    

        this.addEventListener("bubbleEvent", function(e:Event) {
            var pressed:String = e.data.value;
            if (pressed == "Start Game")
            {
                // The block below is approx. how the game starting should work
                //var game = new Game(this.rootSprite);
                //rootSprite.addChild(game);
                //game.startGame();
                //this.removeFromParent();
                //this.dispose();
            }
            else if (pressed == "Tutorial")
            {
                var tutorial = new Tutorial();
                this.addChild(tutorial);
            }
            else if (pressed == "Credits")
            {
                var credits = new Credits();
                this.addChild(credits);
            }
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
}