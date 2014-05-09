package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	
	public class LightSwitch extends MovieClip {
		
		
		
		private var On:Boolean = true;
		public function isOn():Boolean { return On; }
		public var SwitchFlick:Event = new Event("SWITCH_FLICK", true, false);
		var lightOff:Sound = new LightOff();
		var lightOn:Sound = new LightOn();
		
		public function LightSwitch() {
			// constructor code
			stop();
			addEventListener(MouseEvent.MOUSE_DOWN, turnSwitch, false, 0, true);
		}
		
		private function turnSwitch(MouseEvent)
		{
			
			On = !On; //I don't think this is used anywhere, it's just here because I feel like it should be here.
			//It's a clever bit of code that doesn't actually save anything because I just run if statements on the next part.
			if(On) { lightOn.play(); }
			else { lightOff.play(); }
			
			//Play the animation.  This could be done with mods, but I like ternary operator.
			(currentFrame == totalFrames) ? gotoAndStop(1) : gotoAndStop(currentFrame+1);
			dispatchEvent(SwitchFlick);
		}
	}
	
}
