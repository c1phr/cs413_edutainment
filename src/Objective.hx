import starling.core.Starling;

class Objective{
	var Value:Int;
	var PossiblePrimes:Array<Int>;
	var Completed:Bool;
	var AllPrimes:Array<Int>;
	var oom:Int;
	var TotalPossibleVals:Int;

	public function new(OrderOfMagnitude:Int, Primes:Array<Int>){
		AllPrimes = Primes;
		Value = 0;
		Completed = false;

		// Set the value to be of the submitted order of magnitude
		var lowerBound:Int;
		oom = GetOrderOfMagnitude(OrderOfMagnitude);
		if(OrderOfMagnitude == 1) { lowerBound = 2; }
		else { lowerBound = Std.int(oom / 10); }
		while(Value < lowerBound) {
			Value = Std.random(oom);
		}

		// Fill up Possible Primes List
		PossiblePrimes = new Array<Int>();
		var counter = 0;
		while(true){
			if(Math.sqrt(Value) < AllPrimes[counter]){
				break;
			}
			PossiblePrimes[counter] = AllPrimes[counter];
		}
		PossiblePrimes[counter] = Value;
		TotalPossibleVals = counter;
		trace(Value);
	}

	public function check(val:Int):Bool{
		if(Contains(val, AllPrimes) && Value % val == 0 && Value == val){
			Completed = true;
			return true;
		}
		if(Value % val == 0){
			if(Value / val == 1){
				return false;
			}
			Value = Std.int(Value / val);
			PossiblePrimes[TotalPossibleVals] = Value;
			return true;
		} else {
			return false;
		}
	}

	function GetOrderOfMagnitude(OOM:Int):Int{
		var oom = 1;
		for(i in 0...OOM){
			oom *= 10;
		}
		return oom;
	}

	function Contains(val:Int, list:Array<Int>):Bool{
		var counter = 0;
		while(val <= list[counter]){
			if(val == list[counter]){
				return true;
			}
		}
		return false;
	}
}