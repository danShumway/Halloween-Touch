package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	
	
	public class Pumpkin extends MovieClip {
		
		var pumpkinPop:Sound = new PumpkinPop();
		var blow:Sound = new Blow();
		
		public function Pumpkin() 
		{
			pumpkin_eyes_mc.alpha = 0;
			pumpkin_eyes_mc.gotoAndStop(1);
			
			addEventListener(MouseEvent.MOUSE_DOWN, clickEvent);
		}
		
		
		//Turn the pumpkin on and off.
		public function glowChange(glow:Boolean)
		{
			pumpkin_eyes_mc.alpha = int(glow);
		}
		
		//Change the pumpkin's color/make the top pop.
		private function clickEvent(MouseEvent)
		{
			if(Game.dark)
			{
				//More ternary operator.
				(pumpkin_eyes_mc.currentFrame == pumpkin_eyes_mc.totalFrames) ? pumpkin_eyes_mc.gotoAndStop(1) : pumpkin_eyes_mc.gotoAndStop(pumpkin_eyes_mc.currentFrame+1);
				blow.play();
			}
			else
			{
				//Play the head wobble.
				pumpkin_top_mc.play();
				pumpkinPop.play();
			}
		
		}
		
		
		
	}
	
}
