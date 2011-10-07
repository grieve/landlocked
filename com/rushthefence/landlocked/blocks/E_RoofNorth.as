package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RoofNorth extends Block
	{		
		public function E_RoofNorth() 
		{
			block_type = 1005;
			graphic = new Image(CuteAssets.Roof_North);
		}
		
	}

}