package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RampNorth extends Block
	{	
		public function E_RampNorth() 
		{
			block_type = 1001;
			graphic = new Image(CuteAssets.Ramp_North);
		}
		
	}

}