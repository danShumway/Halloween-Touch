package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	
	
	
	public class CreatureUnderTheStairs extends MovieClip {
		
		var grass_rustle:Sound = new GrassRustle();
		
		public function CreatureUnderTheStairs() {
			// constructor code
			addEventListener(MouseEvent.MOUSE_DOWN, growl, false, 0, true);
		}
		
		public function growl(MouseEvent):void
		{
			if(Game.dark){
				eyes_mc.play();
			}
			else {
				grass_mc.play();
				grass_rustle.play();
			}
		}
		
	}
	
}
