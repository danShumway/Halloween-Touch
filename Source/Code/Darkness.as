package Code {
	
	import flash.display.MovieClip;
	
	
	public class Darkness extends MovieClip {
		
		
		public function Darkness() {
			// constructor code
			stop();
			mouseEnabled = false;
			mouseChildren = false;
		}
		
		public function changeState(On:Boolean)
		{
			if(On)
			{
				gotoAndStop(1);
			}
			else
			{
				gotoAndStop(2);
			}
		}
	}
	
}
