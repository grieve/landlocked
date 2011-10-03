package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import flash.geom.Point;
	import net.flashpunk.tweens.misc.ColorTween;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class BlockStack extends BlockController
	{
		private var mInternalStack:Vector.<Block> = new Vector.<Block>();
		private var mCapacity:Number = 0;
		private var mWarningFull:Number = 0;
		private var mWarningEmpty:Number = 0;
		private var mWarningGraphic:Entity = new Entity();; 
		
		public function BlockStack(capacity:Number) 
		{
			super();
			mCapacity = capacity;
		}
		
		override public function pullBlock():Block
		{
			return mInternalStack.pop();
		}
		
		override public function pushBlock(block:Block):void
		{
			block.x = this.x;
			block.y = this.y - (mInternalStack.length * 15);
			block.shadows.removeAll();
			mInternalStack.push(block);
		}
		
		override public function canPushBlock():Boolean
		{
			var notFull:Boolean = mInternalStack.length < mCapacity;
			if (!notFull)
			{
				mWarningFull = 1;
				mWarningGraphic.graphic = new Image(CuteAssets.Max_Block);
			}
			return notFull; 
		}
		
		override public function canPullBlock():Boolean
		{
			var notEmpty:Boolean = mInternalStack.length > 0;
			if (!notEmpty)
			{
				mWarningEmpty = 1;
				mWarningGraphic.graphic = new Image(CuteAssets.Stop_Block);
			}
			return notEmpty; 
		}
		
		override public function update():void
		{
			super.update();
			if (mWarningFull > 0)
			{
				mWarningFull -= FP.elapsed;
			}
			if (mWarningEmpty > 0)
			{
				mWarningEmpty -= FP.elapsed;
			}
			mWarningGraphic.update();
		}
		
		override public function render():void
		{
			super.render();
			for (var ix:Number = 0; ix < mInternalStack.length; ix++)
			{
				mInternalStack[ix].render();
			}
			if (mWarningFull > 0)
			{
				mWarningGraphic.x = this.x;
				mWarningGraphic.y = this.y - (mCapacity * 15);
				mWarningGraphic.render();
			}
			if (mWarningEmpty > 0)
			{
				mWarningGraphic.x = this.x;
				mWarningGraphic.y = this.y;
				mWarningGraphic.render();
			}
		}
		
	}

}