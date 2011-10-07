package com.rushthefence.landlocked.worlds 
{
	import com.rushthefence.landlocked.blocks.Block;
	import com.rushthefence.landlocked.BlockToolbox;
	import com.rushthefence.landlocked.Utils;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class CreateGame extends GameScreen
	{
		private var newBlocks:Number = 0;
		
		public function CreateGame(tilesWide:Number, tilesHigh:Number) 
		{
			super(tilesWide, tilesHigh, 210);
			mBlockController = new BlockToolbox(false, 100);
			mBlockMap.setBlockController(mBlockController);
			while (newBlocks < 120)
			{
				var blk:Block;
				var dx:Number = Math.floor(Math.random() * (tilesWide));
				var dy:Number = Math.floor(Math.random() * (tilesHigh));
				var tt:Number = mBlockMap.mInternalMap[dx][dy].length / 5;
				if (tt > 1)
					tt = 1;
				var bid:Number = Math.floor(Math.random() * (3 * (tt))) + 3;
				if (mBlockMap.mInternalMap[dx][dy][mBlockMap.mInternalMap[dx][dy].length - 1].block_type > bid)
					continue;
				blk = Utils.getBlock(bid);
				mBlockMap.pushBlock(blk, dx, dy);
				newBlocks++;
			}
			mBlockMap.setMode("placing");
		}
		
		override public function updateControls():void
		{
			super.updateControls();
			if (Input.mouseWheel)
			{
				(BlockToolbox)(mBlockController).moveSelection(Input.mouseWheelDelta);
			}
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