package Code {
	
	import flash.display.SimpleButton;
	import flash.events.*;
	import flash.display.MovieClip;
	
	
	public class Button extends SimpleButton {
		
		
		public function Button() {
			// constructor code
			addEventListener(MouseEvent.MOUSE_DOWN, gotoNextFrame, false, 0, true);
		}
		
		private function gotoNextFrame(MouseEvent)
		{
			(parent as MovieClip).gotoAndStop(((parent as MovieClip).currentFrame == (parent as MovieClip).totalFrames)? 
											  1 : 
											  (parent as MovieClip).currentFrame+1);
		}
	}
	
}
