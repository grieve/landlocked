package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RoofSouthWest extends Block
	{		
		public function E_RoofSouthWest() 
		{
			block_type = 1011;
			graphic = new Image(CuteAssets.Roof_South_West);
		}
		
	}

}