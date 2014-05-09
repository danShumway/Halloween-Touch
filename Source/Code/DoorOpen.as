package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class DoorOpen extends MovieClip {
		
		private var finished:Event = new Event("FINISHED", true, false);
		
		public function DoorOpen() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, fire, false, 0, true);
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
