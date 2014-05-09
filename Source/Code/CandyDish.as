package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	
	
	public class CandyDish extends MovieClip {
		
//-----------------------VARIABLES---------------------------------------------------
		
		//Whether or not the dish is empty.
		private var empty:Boolean = false;
		public function isEmpty():Boolean { return empty; }
		//Event for telling when it is empty.
		public var Empty:Event = new Event("EMPTIED");
		var crunch:Sound = new Crunch();
		var rattle:Sound = new Rattle();
	
		//Constructor
		public function CandyDish() {
			addEventListener(MouseEvent.MOUSE_DOWN, takeCandy);
		}
		
		///Take some candy from the bowl.
		private function takeCandy(MouseEvent):void
		{
			//Loop around untill it's empty.
			if(currentFrame < totalFrames && currentLabel != "Empty"){
				gotoAndStop(currentFrame+1);
				crunch.play();
			}
			//If the bowl is empty, rattle it.
			else if (currentLabel == "Empty")
			{
				bowl_mc.play();
				rattle.play();
			}
			if (currentLabel == "Empty"){
				empty = true;
				dispatchEvent(Empty);
			}
		}
		
		//Return to constructor state.
		public function resetCandy()
		{
			gotoAndStop("Refill");
			candy_mc.addEventListener("FINISHED", internalReset);
		}
		
		private function internalReset(Event)
		{
			gotoAndStop(1);
			empty = false;
		}
	}
	
}
