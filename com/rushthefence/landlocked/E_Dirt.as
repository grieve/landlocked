package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Dirt extends Block
	{		
		public function E_Dirt() 
		{
			block_type = 3;
			graphic = new Image(CuteAssets.Dirt_Block);
		}
		
	}

}