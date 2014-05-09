package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;
	
	public class Game extends MovieClip {
		
		//Get some random ambient effects and sounds going on.
		//This is where all of your global sounds will go - (wind, etc...)  - check to see what licenses allow for commercial reuse.
		
		var ambience:Sound = new Wind();
		
		public static var dark:Boolean = false;
		public static var needsRefilling:Boolean = false;
		
		//Just shooting in the dark here.
		public static var mouseOutside:Boolean = false;
		
		
		public function Game() {
			// Add event listeners for objects.
			switch_mc.addEventListener("SWITCH_FLICK", switchLight, false, 0, true);
			door_mc.addEventListener("REFILLED", candyRefilled, false, 0, true);
			candy_dish_mc.addEventListener("EMPTIED", candyEmpty, false, 0, true);
			ambience.play(0, int.MAX_VALUE);
		}
		
		//Light controller.
		public function switchLight(Event)
		{
			darkness_mc.changeState(switch_mc.isOn());
			dark = !dark;
			door_mc.abort();
			pumpkin_mc.glowChange(dark);
		}
		
		//When the candy dish is emptied.
		public function candyEmpty(Event)
		{
			trace("EMPTY");
			needsRefilling = true;
		}
		
		//When the candy dish is refilled.
		public function candyRefilled(Event)
		{
			candy_dish_mc.resetCandy();
			needsRefilling = false;
		}
		
		//Handle the event listener for the door refilling the candy.
		
		//Handle an event listener for.... what else?  Random sounds?
	}
	
}
