package Code {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class ProceduralLeaves extends MovieClip {
		
		private var Leaves:Array = new Array();
		private var numLeaves:int = 5;
		private var stageHeight:int = 768;//stage.stageHeight;
		private var stageWidth:int = 1024;//stage.stageWidth;
		
		
		public function ProceduralLeaves() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, onFrame, false, 0, true);
			//Generate a starting number of leaves.
			for(var i:int = 0; i<numLeaves; i++)
			{
				//Set initial parameters.
				Leaves[i] = new Leaf();
				addChild(Leaves[i]);
				Leaves[i].x = Math.random()* stageWidth; //Position.
				Leaves[i].y = -(Math.random()* 800);
				Leaves[i].scaleX = .54;
				Leaves[i].scaleY = .54;
				Leaves[i].reset();
				
			}
		}
		
		
		
		private function onFrame(Event)
		{
			for(var i:int = 0; i<Leaves.length; i++)
			{
				Leaves[i].y += Leaves[i].yVelocity; //Replace with a more realistic gravity model that changes based on how close you are to the center of the scren.
				//Also modify rotation.
				Leaves[i].x += Leaves[i].xVelocity; 
				Leaves[i].rotation += Leaves[i].rotVelocity;
				//Reset leaves if they're off of the stage.
				if(Leaves[i].y > stageHeight + Leaves[i].height || 
				   Leaves[i].x > stageWidth + Leaves[i].width ||
				   Leaves[i].x < -Leaves[i].width)
				{
				   Leaves[i].x = Math.random()*stageWidth;
				   Leaves[i].y = 0 - Leaves[i].height;
				   Leaves[i].reset();
				}
			}
		}
	}
	
}
