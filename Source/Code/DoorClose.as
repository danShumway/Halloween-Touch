package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class DoorClose extends MovieClip {
		
		private var finished:Event = new Event("FINISHED", true, false);
		
		public function DoorClose() {
			stop();
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
