package Code
{

	import flash.display.MovieClip;
	import flash.events.*;
	import flash.media.Sound;

	public class Door extends MovieClip
	{
		//--------------------VARIABLES AND ACCESSORS------------
		
		//Used to prevent duplicate clicks.
		private var busy:Boolean = false;
		public function inAnimation():Boolean { return busy; }
		
		//Event that gets triggered when a user clicks on the door.
		public var Knocking:Event = new Event("KNOCK", true, false);
		public var Refilled:Event = new Event("REFILLED", true, false);
		
		//Sound
		var plop:Sound = new Plop();
		var doorHit:Sound = new DoorHit();
		var doorOpen:Sound = new DoorOpenSound();
		var doorClose:Sound = new DoorCloseSound();

		
		//----------------------METHODS-----------------------
		
		//Constructor.
		public function Door()
		{
			stop();
			addEventListener(MouseEvent.MOUSE_DOWN, knock, false, 0, true);
			knock_mc.visible = false;
		}

		
		//What happens when the door is clicked on.
		//Step 1.
		private function knock(e:MouseEvent):void
		{
			if(!busy)
			{
				busy = true;
				//Send out event that the door has opened.
				dispatchEvent(Knocking);
				//Push knock animation.
				knock_mc.visible = true;
				knock_mc.x = this.x + e.localX;
				knock_mc.y = this.y + e.localY;
				//Start knock animation.
				knock_mc.visible = true;
				knock_mc.gotoAndPlay(1);
				//Add event listener.
				knock_mc.addEventListener("FINISHED", openDoor);
				//Play sound
				doorHit.play();
				
			}
		}
		
		//Step 2.  Open the door.
		private function openDoor(Event):void
		{
			//
			knock_mc.removeEventListener("FINISHED", openDoor);
			knock_mc.visible = false;
			//If it's not dark out.
			if(!Game.dark)
			{
				gotoAndStop("Open");
				open_door_mc.addEventListener("FINISHED", fillCandyDish, false, 0, true);
				open_door_mc.play();
				//Open Door.
				doorOpen.play();
				//Play sound.
			}
			else
			{
				//End.
				reset(null);
			}
		}
		
		//Step 3. Refill Candy.
		private function fillCandyDish(Event):void
		{
			open_door_mc.removeEventListener("FINISHED", fillCandyDish);
			
			//Global variable in main timeline is used to communicate between symbols.
			//They're static.
			if(Game.needsRefilling)
			{
				gotoAndStop("Refill");
				arm_mc.play();
				arm_mc.addEventListener("REFILLED", refilled, false, 0, true);
				arm_mc.addEventListener("FINISHED", closeDoor, false, 0, true);
			}
			else
			{
				//Close the door.
				closeDoor(null);
			}
		}
		
		//Signal that we've refilled the bowl.
		//This will trigger a bowl filling animation (separate from the hand animation).
		//This way, the bowl will be refilled, even if the guy is interrupted during the refill.
		private function refilled(Event)
		{
			arm_mc.removeEventListener("REFILLED", refilled);
			dispatchEvent(Refilled); 
			plop.play();
		}
		
		//Step 4. close door.
		private function closeDoor(Event):void
		{
			if(Event!=null)
			{
				trace("remove");
				arm_mc.removeEventListener("FINISHED", closeDoor);
			}
			gotoAndStop("Close");
			close_door_mc.play();
			close_door_mc.addEventListener("FINISHED", reset, false, 0, true);
			doorClose.play();
		}
		
		//Final
		private function reset(Event):void
		{
			gotoAndStop("Base");
			busy = false;
		}
		
		//If the lights are turned off, this can get called quickly and it will clean up anything that's going wrong.
		public function abort():void
		{
			if(busy){
				closeDoor(null);
			}
		}
	}
}