package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_RoofSouth extends Block
	{		
		public function E_RoofSouth() 
		{
			block_type = 1007;
			graphic = new Image(CuteAssets.Roof_South);
		}
		
	}

}