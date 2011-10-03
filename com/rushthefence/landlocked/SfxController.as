package com.rushthefence.landlocked 
{
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class SfxController 
	{
		
		[Embed(source = 'assets/sfx/dig.mp3')] private static var DIG_SFX:Class;
		[Embed(source = 'assets/sfx/drop.mp3')] private static var DROP_SFX:Class;
		[Embed(source = 'assets/sfx/rotate.mp3')] private static var ROTATE_SFX:Class;
		
		private static var dig_sfx:Sfx = new Sfx(DIG_SFX);
		private static var drop_sfx:Sfx = new Sfx(DROP_SFX);
		private static var rotate_sfx:Sfx = new Sfx(ROTATE_SFX);
		
		public function SfxController() 
		{
			
		}
		
		public static function play(sound:String):void
		{
			switch(sound)
			{
				case 'dig':
					dig_sfx.play();
					break;
				case 'drop':
					drop_sfx.play();
					break;
				case 'rotate':
					rotate_sfx.play();
					break;
			}
		}
		
	}

}