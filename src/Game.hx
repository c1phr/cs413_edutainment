import Math.*;
import starling.display.Sprite;
import starling.utils.AssetManager;
import starling.display.Image;
import starling.core.Starling;
import starling.animation.Transitions;
import starling.events.KeyboardEvent;
import flash.ui.Keyboard;
import starling.events.Touch;
import starling.events.Event;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.events.EnterFrameEvent;
import starling.utils.RectangleUtil;
import starling.utils.MathUtil;
import flash.media.Sound;
import flash.media.SoundChannel;
import haxe.Timer;

class Game extends Sprite
{

	var rootSprite:Sprite;
	//public var bubble:Bubble;
	public var objective:Objective;
	public var AllPrimes:Array<Int>;
	public var Primes:Array<Int>;
	public var inGame:Bool;
	public var solved:Bool;
	public var inc:Int;
	public var Bubbles:Array<Bubble>;
	private var counter:Int;

	public function new(rootSprite)
	{

		super();
		this.rootSprite = rootSprite;

	}

	public function startGame()
	{
		solved = true;
		inGame = true;

		AllPrimes = findAllPrimes();

		inc = 0;

		//while(inGame = true){

			//if(solved == true){
			objective = makeObjective(AllPrimes);
				//solved = false;
			//}
			
			Bubbles = new Array<Bubble>();
			var timer1 = new haxe.Timer(2000);
			timer1.run;// = increment(inc);
			var timer = new haxe.Timer(2000);
			timer.run;// = addBubble();
			
			rootSprite.addEventListener(EnterFrameEvent.ENTER_FRAME, function(event:EnterFrameEvent) {
				counter = counter+1;
				if(counter == 120){
					//addBubble(Bubbles, inc);
					var bubble:Bubble;

					Primes = objective.PossiblePrimes;

					var height:Float = random() * 400;

					var arrlength:Int = Primes.length;

					var chooseIndex:Int = Math.round(random() * arrlength);

					var value:Int = Primes[chooseIndex];

					var strValue:String = "" + value;

					bubble = new Bubble(Root.assets.getTexture("bubble1"), strValue, 1, false);
					addChild(bubble);
					bubble.x = Starling.current.stage.stageWidth/2*random();
					bubble.y = Starling.current.stage.stageHeight/5*random();

					this.addEventListener("bubbleEvent", function(e:Event) {
            			var pressed:String = e.data.value;
            			trace(pressed);
            			removeChild(bubble);
        			});
					Bubbles.push(new Bubble(Root.assets.getTexture("bubble1"), strValue, 1, false));
					//inc = inc+1;
					counter = 0;
					//rootSprite.addChild(Bubbles[0]);
					//trace("butts");
				}
				//trace("asdfasdfa");
			});
			/*if(objective.check() == true){
				solved = true;
			}*/


		//}
		

	}

	public function addBubble(Bubbles:Array<Bubble>, inc:Int)
	{
		

       //Bubbles[inc] = bubble;
       //trace(Bubbles[inc]);
	}

	public function makeObjective(Primes:Array<Int>) : Objective{

		var obj:Objective;
		var mag:Int = Math.round(random() * 2)+1;

		obj = new Objective(mag, Primes);

		return obj;

	}

	static function findAllPrimes():Array<Int>{
        var list:Array<Int>;
        list = new Array<Int>();
        list[0] = 2;
        list[1] = 3;
        list[2] = 5;
        var value = 6;
        var counter = 3;
        while(counter < 10000){
            if(checkPrime(value, list)){
                list[counter] = value;
                counter++;
            }
            value++;
        }
        return list;
    }

    static function checkPrime(p:Int, list:Array<Int>):Bool{
        var ctr = 0;
        while(list[ctr] <= Math.sqrt(p)){
            if(p % list[ctr] == 0){
                return false;
            }
            ctr++;
        }
        return true;
    }

    public function increment(inc:Int):Int{
    	return inc+1;
    }

}