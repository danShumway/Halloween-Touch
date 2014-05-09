package Code {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Spiderweb extends MovieClip {
		
		var TIMERTHRESHOLD:int = 8000; //8 second
		var TIMERVARIABILITY:int = 3000; //3 second
		var randomizedMotion:Timer = new Timer(100, 0);
		
		
		public function Spiderweb() {
			// constructor code
			randomizedMotion.addEventListener(TimerEvent.TIMER, swingSpider);
			randomizedMotion.start();
			addEventListener(MouseEvent.MOUSE_DOWN, dropSpider);
			
		}
		
		//Swing the spider back and forth on a random time interval.
		private function swingSpider(event) {
			if(spider.currentLabel == "start")
			{
				spider.gotoAndPlay("sway");
			}
			//Reset the motion for the timer.
			randomizedMotion.delay = TIMERTHRESHOLD + (Math.random()*TIMERVARIABILITY*2) - TIMERVARIABILITY;
		}
		
		//Player the spider falls animation.
		public function dropSpider(event:MouseEvent)
		{
			//Just a bugcheck to make sure nothing fails horribly.  Not the best if statement I've ever written.
			//Mostly it's those hardcoded 3s and 2s that make me cringe, but I'll have to fix them later if at all.
			if(spider.currentLabels[3].name == "climbing" && spider.currentLabels[2].name == "fall")
			{
				if(spider.currentLabel == "climbing")
				{
					
					//The climbing animation is twice as long as the falling animation, so it's divided by 2.
					var toGo:Number = spider.currentLabels[3].frame - Math.round((spider.currentFrame - spider.currentLabels[3].frame)/2)
					//avoid errors where currentLabel doesn't update quickly enough.
					if(toGo > spider.currentLabels[2].frame)
					{
						trace("---------------------");
						trace(spider.currentFrame);
						trace(spider.currentLabel);
						trace("Going to : " + (spider.currentLabels[3].frame - Math.round((spider.currentFrame - spider.currentLabels[3].frame))/2));
						spider.gotoAndPlay(spider.currentLabels[3].frame - Math.round((spider.currentFrame - spider.currentLabels[3].frame)/2));
						trace(spider.currentFrame);
						trace("--------------------");
					}
					trace(spider.currentFrame)
					{
						trace("-------------------");
					}
				}
				else if (spider.currentLabel != "fall")
				{
					spider.gotoAndPlay("fall");
				}
				//else
			}
		}
	}
	
}
