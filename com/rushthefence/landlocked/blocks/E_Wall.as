package com.rushthefence.landlocked.blocks 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import com.rushthefence.landlocked.CuteAssets;
	 
	public class E_Wall extends Block
	{		
		public function E_Wall() 
		{
			block_type = 6;
			graphic = new Image(CuteAssets.Wall_Block);
		}
		
	}

}