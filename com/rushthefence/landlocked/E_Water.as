package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Water extends Block
	{		
		public function E_Water() 
		{
			block_type = 7;
			graphic = new Image(CuteAssets.Water_Block);
		}
		
	}

}