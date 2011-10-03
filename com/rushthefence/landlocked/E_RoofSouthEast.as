package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_RoofSouthEast extends Block
	{		
		public function E_RoofSouthEast() 
		{
			block_type = 1010;
			graphic = new Image(CuteAssets.Roof_South_East);
		}
		
	}

}