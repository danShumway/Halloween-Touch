package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Table extends MovieClip {
		
		
		public function Table() {
			// constructor code
			trace("trigger");
			addEventListener(MouseEvent.MOUSE_DOWN, temp_blow);
			
		}
		
		private function temp_blow(event:MouseEvent)
		{
			trace("trigger");
			cloth_front_mc.play();
		}
	}
	
}
