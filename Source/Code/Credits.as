package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	
	public class Credits extends MovieClip {
		
		
		public function Credits() {
			// constructor code
			addEventListener(MouseEvent.MOUSE_DOWN, clicked);
			
		}
		
		private function clicked(event:MouseEvent)
		{
			play();
		}
	}
	
}
