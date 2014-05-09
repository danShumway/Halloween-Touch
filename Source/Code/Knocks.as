package Code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Knocks extends MovieClip {
		
		public var finished:Event = new Event("FINISHED", true, false);
		
		public function Knocks() {
			addEventListener(Event.ENTER_FRAME, fire, false, 0, true);
			stop();
		}
		
		public function fire(Event)
		{
			if(currentFrame == totalFrames)
			{
				dispatchEvent(finished);
			}
		}
	}
}