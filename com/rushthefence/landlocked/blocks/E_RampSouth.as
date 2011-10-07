package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RampSouth extends Block
	{	
		public function E_RampSouth() 
		{
			block_type = 1003;
			graphic = new Image(CuteAssets.Ramp_South);
		}
		
	}

}