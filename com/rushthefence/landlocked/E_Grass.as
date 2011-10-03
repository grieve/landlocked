package com.rushthefence.landlocked 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	 
	public class E_Grass extends Block
	{		
		public function E_Grass() 
		{
			block_type = 4;
			graphic = new Image(CuteAssets.Grass_Block);
		}
		
	}

}