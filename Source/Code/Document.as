package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.display.Stage;
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	
	
	
	public class Document extends MovieClip {
		
		public function Document() 
		{
		
			addEventListener(Event.ADDED_TO_STAGE, setup);
			stop();
		}
		
		public function setup(event)
		{
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			removeEventListener(Event.ADDED_TO_STAGE, setup);
		}
		
	}
	
}
