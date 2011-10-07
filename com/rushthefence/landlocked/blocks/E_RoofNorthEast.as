package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RoofNorthEast extends Block
	{		
		public function E_RoofNorthEast() 
		{
			block_type = 1009;
			graphic = new Image(CuteAssets.Roof_North_East);
		}
		
	}

}