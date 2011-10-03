package com.rushthefence.landlocked
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import com.flashdynamix.utils.SWFProfiler;

	/**
	 * ...
	 * @author Ryan Grieve
	 */
	[Frame(factoryClass="com.rushthefence.landlocked.Preloader")]
	public class Main extends Engine 
	{
		public function Main():void 
		{
			super(700, 500, 30, false);
			if (stage) ready();
			else addEventListener(Event.ADDED_TO_STAGE, ready);
		}

		private function ready(e:Event = null):void 
		{
			SWFProfiler.init(FP.stage, this);
			removeEventListener(Event.ADDED_TO_STAGE, ready);
			FP.world = new CreateGame(10,10);
		}
	
	}
	
}