package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class Backdrop extends Entity
	{
		[Embed(source = 'assets/backdrop.png')] private var BACK_DROP:Class;
		public function Backdrop() 
		{
			graphic = new Image(BACK_DROP);
			layer = 10000;
		}
		
	}

}