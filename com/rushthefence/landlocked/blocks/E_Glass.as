package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_Glass extends Block
	{		
		public function E_Glass() 
		{
			block_type = 8;
			graphic = new Image(CuteAssets.Glass_Block);
		}
		
	}

}