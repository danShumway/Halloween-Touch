package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	import flash.geom.ColorTransform;
	import flash.media.Sound;
	
	
	//At some point you should hook this up with actual random motion.  That would be cool.
	public class Leaf extends MovieClip {
		
		public var xVelocity:Number;
		public var yVelocity:Number;
		public var rotVelocity:Number;
		var leaf_crunch:Sound = new LeafCrunch();
		
		public function Leaf() {
			// constructor code
			addEventListener(MouseEvent.MOUSE_DOWN, crinkle);//, false, 1, true;
			addEventListener(MouseEvent.MOUSE_UP, releaseGrip);
		}
		
		private function crinkle(MouseEvent):void
		{
			this.gotoAndStop(2);
			xVelocity = 0;
			yVelocity = 0;
			rotVelocity = 0;
			startDrag(true);
			leaf_crunch.play();
		}
		
		private function releaseGrip(MouseEvent):void
		{	
			if(currentFrame == 2)
			{
				stopDrag();
				yVelocity = 20;
			}
		}
		
		public function reset():void
		{
			this.gotoAndStop(1);
			this.xVelocity = Math.random()* 12 - 6;
			this.yVelocity = 7;
			this.rotVelocity = Math.random()*8 - 4;
			this.rotation = Math.random()*90;
			this.transform.colorTransform = new ColorTransform(Math.random(), Math.random(), Math.random(), 1.0, 0,0,0,0);
			
		}
	}
	
}
