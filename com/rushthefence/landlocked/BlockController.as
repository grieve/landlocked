package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class BlockController extends Entity
	{
		
		public function BlockController() 
		{
			
		}
		
		public function pullBlockType():Number
		{
			return 0;
		}
		
		public function pullBlock():Block
		{
			return null;
		}
		
		public function pushBlock(block:Block):void
		{
			
		}
		
		public function canPullBlock():Boolean
		{
			return false;
		}
		
		public function  canPushBlock():Boolean
		{
			return false;
		}
	}

}