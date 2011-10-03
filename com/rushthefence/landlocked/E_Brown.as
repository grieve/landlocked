package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Brown extends Block
	{		
		public function E_Brown() 
		{
			block_type = 2;
			graphic = new Image(CuteAssets.Brown_Block);
		}
		
	}

}