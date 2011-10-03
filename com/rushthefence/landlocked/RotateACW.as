package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class RotateACW extends Entity
	{
		[Embed(source = 'assets/rotate_acw.png')] private var ACW_ARROW:Class;
		private var bbmp:BlockMap;
		public function RotateACW(mp:BlockMap) 
		{
			bbmp = mp;
			graphic = new Image(ACW_ARROW);
			setHitbox(35, 60, x, y);
		}
		
		override public function update():void
		{
			super.update();
			if (Input.mousePressed)
			{
				if (collidePoint(x, y, Input.mouseX, Input.mouseY))
				{
					bbmp.rotateView(1);
				}
			}
		}
		
	}
}