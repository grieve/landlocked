package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RampEast extends Block
	{	
		public function E_RampEast() 
		{
			block_type = 1002;
			graphic = new Image(CuteAssets.Ramp_East);
		}
		
	}

}