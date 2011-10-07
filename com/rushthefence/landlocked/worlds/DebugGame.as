package com.rushthefence.landlocked.worlds 
{
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class DebugGame extends GameScreen
	{
		private var newBlocks:Number = 0;
		
		public function DebugGame(tilesWide:Number, tilesHigh:Number) 
		{
			super(tilesWide, tilesHigh);
			mBlockController = new BlockStack(20);
			mBlockController.x = 20;
			mBlockController.y = 400;
			mBlockMap.setMode("stacking");
			mBlockMap.setBlockController(mBlockController);
		}
		
		override public function update():void
		{
			super.update();
			if (newBlocks < 50)
			{
				var blk:Block;
				var dx:Number = Math.floor(Math.random() * (Registry.NUM_TILES_WIDE));
				var dy:Number = Math.floor(Math.random() * (Registry.NUM_TILES_HIGH));
				var tt:Number = mBlockMap.mInternalMap[dx][dy].length / 5;
				if (tt > 1)
					tt = 1;
				var bid:Number = Math.floor(Math.random() * (6 * (tt))) + 1;
				if (mBlockMap.mInternalMap[dx][dy][mBlockMap.mInternalMap[dx][dy].length - 1].block_type >= bid)
					return;
				blk = Utils.getBlock(bid);
				mBlockMap.pushBlock(blk, dx, dy);
				newBlocks++;
			}
		}
		
		override public function updateControls():void
		{
			super.updateControls();
			if (Input.released(Key.V))
			{
				mBlockMap.setMode("placing");
			}
			if (Input.released(Key.X))
			{
				mBlockMap.setMode("stacking");
			}
		}
	}

}