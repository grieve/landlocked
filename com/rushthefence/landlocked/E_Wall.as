package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Wall extends Block
	{		
		public function E_Wall() 
		{
			block_type = 6;
			graphic = new Image(CuteAssets.Wall_Block);
		}
		
	}

}