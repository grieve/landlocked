package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofNorth extends Block
	{		
		public function E_RoofNorth() 
		{
			block_type = 1005;
			graphic = new Image(CuteAssets.Roof_North);
		}
		
	}

}