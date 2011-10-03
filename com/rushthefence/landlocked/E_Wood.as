package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Wood extends Block
	{		
		public function E_Wood() 
		{
			block_type = 5;
			graphic = new Image(CuteAssets.Wood_Block);
		}
		
	}

}