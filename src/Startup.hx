import flash.display.Bitmap;
import flash.display.Sprite;
import flash.geom.Rectangle;
import starling.core.Starling;

@:bitmap("assets/loading.png")
class LoadingBitmapData extends flash.display.BitmapData {}

class Startup extends Sprite {

    public var loadingBitmap:Bitmap;
    public var startup:Sprite;

    function new() {
        super();
        startup = this;
        loadingBitmap = new Bitmap(new LoadingBitmapData(0, 0));
        loadingBitmap.x = 0;
        loadingBitmap.y = 0;
        loadingBitmap.width = flash.Lib.current.stage.stageWidth;
        loadingBitmap.height = flash.Lib.current.stage.stageHeight;
        loadingBitmap.smoothing = true;
        addChild(loadingBitmap);

        flash.Lib.current.stage.addEventListener(flash.events.Event.RESIZE,
            function(e:flash.events.Event) {
                Starling.current.viewPort = new Rectangle(0, 0,
                flash.Lib.current.stage.stageWidth,
                flash.Lib.current.stage.stageHeight);
                if (loadingBitmap != null) {
                    loadingBitmap.width = flash.Lib.current.stage.stageWidth;
                    loadingBitmap.height = flash.Lib.current.stage.stageHeight;
                }});

		var mStarling = new Starling(Root, flash.Lib.current.stage);
		mStarling.antiAliasing = 0;
		function onRootCreated(event:Dynamic, root:Root) {
			mStarling.removeEventListener(starling.events.Event.ROOT_CREATED,
			    onRootCreated);
            root.start(this);
            mStarling.start();
        }
        mStarling.addEventListener(starling.events.Event.ROOT_CREATED,
		    onRootCreated);
    }

    static function main() {
        var stage = flash.Lib.current.stage;
        var PrimeList = findAllPrimes();
        stage.addChild(new Startup());
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

}
