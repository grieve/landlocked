package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RampWest extends Block
	{	
		public function E_RampWest() 
		{
			block_type = 1004;
			graphic = new Image(CuteAssets.Ramp_West);
		}
		
	}

}