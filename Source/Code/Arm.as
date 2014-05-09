package Code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Arm extends MovieClip {
		
		public var finished:Event = new Event("FINISHED");
		public var refilled:Event = new Event("REFILLED");
		
		public function Arm() {
			addEventListener(Event.ENTER_FRAME, fire, false, 0, true);
		}
		
		public function fire(Event)
		{
			if(currentLabel == "Refilled"){
				dispatchEvent(refilled);
			}
			if(currentFrame == totalFrames)
			{
				gotoAndStop(1);
				dispatchEvent(finished);

			}
		}
	}
	
}
