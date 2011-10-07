package com.rushthefence.landlocked 
{
	import com.rushthefence.landlocked.blocks.Block;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class BlockToolbox extends BlockController
	{
		private var mUnlimited:Boolean;
		private var mInternalToolbox:Vector.<Block>;
		private var mInternalBlockCount:Vector.<Number>;
		private var mCurrentBlock:Number = 0;
		public var mScrollOffset:Number = 0;
		private var mAccumulatedScroll:Number = 0;
		
		private var mHighlight:Spritemap = new Spritemap(CuteAssets.Toolbox_Hilight, 50, 60);
		
		public function BlockToolbox(unlimited:Boolean = true, initialValue:Number = 0) 
		{
			super();
			mUnlimited = unlimited;
			mInternalToolbox = new Vector.<Block>();
			mInternalBlockCount = new Vector.<Number>();
			mHighlight.add("spin", [0, 1, 2, 3, 2, 1], 20, true);
			mHighlight.play("spin");
			buildToolbox(initialValue);
		}
		
		public function buildToolbox(initialValue:Number):void
		{
			for (var iter:Number = 0; iter <= 8; iter++)
			{
				mInternalToolbox.push(Utils.getBlock(iter));
				mInternalBlockCount.push(initialValue);
			}
			for (iter = 1001; iter <= 1012; iter++)
			{
				mInternalToolbox.push(Utils.getBlock(iter));
				mInternalBlockCount.push(initialValue);
			}
		}

		override public function pullBlockType():Number
		{
			return mCurrentBlock;
		}
		
		public function moveSelection(num:Number):void
		{
			/*mAccumulatedScroll += num;
			trace(mAccumulatedScroll);
			if (mAccumulatedScroll >= 3 || mAccumulatedScroll <= -3)
			{
				var actual:Number = Math.floor(mAccumulatedScroll / 3);
				mCurrentBlock -= actual;
				if (mCurrentBlock < 0)
					mCurrentBlock = 0;
				if (mCurrentBlock > mInternalBlockCount.length-1)
					mCurrentBlock = mInternalBlockCount.length - 1;
					
				if (mCurrentBlock > 8)
				{
					mScrollOffset =  -((mCurrentBlock-8) * 50);
				}
				else
				{
					mScrollOffset = 0;
				}
				mAccumulatedScroll = 0;
			}*/
			if (num > 0)
				mCurrentBlock--;
			else
				mCurrentBlock++;
			
			if (mCurrentBlock < 0)
				mCurrentBlock = 0;
			if (mCurrentBlock > mInternalBlockCount.length-1)
				mCurrentBlock = mInternalBlockCount.length - 1;
				
			if (mCurrentBlock > 8)
			{
				mScrollOffset =  -((mCurrentBlock-8) * 50);
			}
			else
			{
				mScrollOffset = 0;
			}
		}
		
		override public function canPullBlock():Boolean
		{
			if (mUnlimited)
				return true;
			
			if (mInternalBlockCount[mCurrentBlock] > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		override public function canPushBlock():Boolean
		{
			return true;
		}
		
		override public function pullBlock():Block
		{
			if (!mUnlimited)
				mInternalBlockCount[mCurrentBlock]--;
				
			return Utils.getBlock(mInternalToolbox[mCurrentBlock].block_type);
		}
		
		override public function pushBlock(block:Block):void
		{
			if (!mUnlimited)
			{
				if (block.block_type > 1000)
					mInternalBlockCount[block.block_type-992]++;
				else
					mInternalBlockCount[block.block_type]++;
			}
		}
		
		override public function update():void
		{
			super.update();
			mHighlight.update();
		}
		
		override public function render():void
		{
			Draw.rect(0, 0, 74, 700, 0x000000, 0.3);
			mHighlight.x = this.x + 60;
			mHighlight.y = this.y +(mCurrentBlock * 50) +mScrollOffset;
			mHighlight.render(FP.buffer, new Point(this.x, this.y), new Point(0, 0));
			for (var iter:Number = 0; iter < mInternalToolbox.length; iter++)
			{
				mInternalToolbox[iter].x = this.x + 18;
				mInternalToolbox[iter].y = this.y +(iter * 50) +mScrollOffset;
				if (iter == mCurrentBlock)
					mInternalToolbox[iter].x += 5;
				mInternalToolbox[iter].render();
				var amountText:Text; 
				if (mUnlimited)
					amountText = new Text("--", mInternalToolbox[iter].x + 40, mInternalToolbox[iter].y + 46, 0, 0);
				else
					amountText = new Text(mInternalBlockCount[iter].toString(), mInternalToolbox[iter].x + 40, mInternalToolbox[iter].y + 46, 0, 0);
				amountText.x -= amountText.width;
				amountText.render(FP.buffer, new Point(this.x, this.y), new Point(0, 0));
			}
		}
	}

}