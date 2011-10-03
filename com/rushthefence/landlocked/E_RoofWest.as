package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofWest extends Block
	{		
		public function E_RoofWest() 
		{
			block_type = 1008;
			graphic = new Image(CuteAssets.Roof_West);
		}
		
	}

}