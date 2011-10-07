package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_Dirt extends Block
	{		
		public function E_Dirt() 
		{
			block_type = 3;
			graphic = new Image(CuteAssets.Dirt_Block);
		}
		
	}

}