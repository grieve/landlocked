package com.rushthefence.landlocked.blocks 
{
	import flash.display.Graphics;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	dynamic public class Block extends Entity
	{
		public var shadows:Graphiclist = new Graphiclist();
		
		public var tile_x:Number = 0;
		public var tile_y:Number = 0;
		public var tile_z:Number = 0;
		
		public var block_type:Number;
		
		public function Block() 
		{
			setHitbox(35, 45, 0, 18);
		}
		
		override public function update():void
		{
			super.update();
		}
	
		override public function render():void
		{
			super.render();
			shadows.render(FP.buffer, new Point(this.x, this.y), new Point(0, 0));
		}
		
		public function mouseHitTest():Boolean
		{
			var isHit:Boolean = collidePoint(x, y + 28, Input.mouseX, Input.mouseY);
			return isHit;
		}
	}

}