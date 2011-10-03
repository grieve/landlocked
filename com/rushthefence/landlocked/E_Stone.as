package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Stone extends Block
	{		
		public function E_Stone() 
		{
			block_type = 1;
			graphic = new Image(CuteAssets.Stone_Block);
		}
		
	}

}