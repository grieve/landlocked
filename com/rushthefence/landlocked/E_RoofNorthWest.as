package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofNorthWest extends Block
	{		
		public function E_RoofNorthWest() 
		{
			block_type = 1012;
			graphic = new Image(CuteAssets.Roof_North_West);
		}
		
	}

}