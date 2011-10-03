package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class RotateCW extends Entity
	{
		[Embed(source = 'assets/rotate_cw.png')] private var CW_ARROW:Class;
		private var bbmp:BlockMap;
		public function RotateCW(mp:BlockMap) 
		{
			bbmp = mp;
			graphic = new Image(CW_ARROW);
			setHitbox(35, 60, x, y);
		}
		
		override public function update():void
		{
			super.update();
			if (Input.mousePressed)
			{
				if (collidePoint(x, y, Input.mouseX, Input.mouseY))
				{
					bbmp.rotateView(-1);
				}
			}
		}
		
	}

}