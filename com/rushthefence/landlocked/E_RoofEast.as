package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofEast extends Block
	{		
		public function E_RoofEast() 
		{
			block_type = 1006;
			graphic = new Image(CuteAssets.Roof_East);
		}
		
	}

}