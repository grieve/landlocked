package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_Plain extends Block
	{	
		public function E_Plain() 
		{
			block_type = 0;
			graphic = new Image(CuteAssets.Plain_Block);
		}
		
	}

}