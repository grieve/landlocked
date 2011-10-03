package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofSouthWest extends Block
	{		
		public function E_RoofSouthWest() 
		{
			block_type = 1011;
			graphic = new Image(CuteAssets.Roof_South_West);
		}
		
	}

}