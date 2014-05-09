package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Fruit extends MovieClip {
		
		public var finished:Event = new Event("FINISHED");
		//Constructor
		public function Fruit() {
			addEventListener(Event.ENTER_FRAME, fire, false, 0, true);
		}
		
		public function fire(Event)
		{
			if(currentFrame == totalFrames)
			{
				gotoAndStop(1);
				dispatchEvent(finished);
			}
		}
		
	}
	
}
