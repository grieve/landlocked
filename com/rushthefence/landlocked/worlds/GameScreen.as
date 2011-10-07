package com.rushthefence.landlocked.worlds 
{
	import com.rushthefence.landlocked.Backdrop;
	import com.rushthefence.landlocked.BlockController;
	import com.rushthefence.landlocked.BlockMap;
	import com.rushthefence.landlocked.Clouddrop;
	import com.rushthefence.landlocked.RotateACW;
	import com.rushthefence.landlocked.RotateCW;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class GameScreen extends World
	{
		protected var mBlockMap:BlockMap;
		protected var mRotateCW:RotateCW;
		protected var mRotateACW:RotateACW;
		protected var mBackdrop:Backdrop;
		protected var mClouddrop:Clouddrop;
		protected var mBlockController:BlockController;
		
		public function GameScreen(tilesWide:Number, tilesHigh:Number, blockmapOffsetX:Number = 175, blockmapOffsetY:Number = 140) 
		{
			mBackdrop = new Backdrop();
			mClouddrop = new Clouddrop(FP.stage.width, FP.stage.height, 25);
			
			mBlockMap = new BlockMap(tilesWide, tilesHigh, blockmapOffsetX, blockmapOffsetY);
			
			mRotateCW = new RotateCW(mBlockMap);
			mRotateCW.x = blockmapOffsetX+(35*tilesWide);
			mRotateCW.y = blockmapOffsetY+(30*tilesHigh)-30;
			mRotateACW = new RotateACW(mBlockMap);
			mRotateACW.x = blockmapOffsetX-35;
			mRotateACW.y = blockmapOffsetY+(30*tilesHigh)-30;
		}
		
		override public function render():void
		{
			super.render();
			mBackdrop.render();
			mClouddrop.render();
			mBlockMap.render();
			mBlockController.render();
			mRotateCW.render();
			mRotateACW.render();
		}
		
		override public function update():void
		{
			super.update();
			updateControls();
			mBackdrop.update();
			mClouddrop.update();
			mBlockMap.update();
			mBlockController.update();
			mRotateCW.update();
			mRotateACW.update();
		}
		
		public function updateControls():void
		{
			if (Input.released(Key.A))
			{
				mBlockMap.rotateView(1);
			}
			if (Input.released(Key.D))
			{
				mBlockMap.rotateView(-1);
			}
			if (Input.released(Key.P))
			{
				trace(mBlockMap.mapToString());
			}
		}
		
	}

}