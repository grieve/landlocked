package com.rushthefence.landlocked 
{
	import com.rushthefence.landlocked.Block;
	import flash.geom.ColorTransform;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.tweens.misc.ColorTween;
	import net.flashpunk.utils.Input;
	import flash.geom.Point;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class BlockMap extends Entity
	{
		public var mInternalMap:Array;
		public var mTransmap:Array;
		private var mTilesWide = 0;
		private var mTilesHigh = 0;
		
		private var mBlockController:BlockController;
		private var mCursor:Cursor = new Cursor();
		
		private var mMode:String = "";
		
		public function BlockMap(w:int, h:int, ox:int = 0, oy:int = 0) 
		{
			mTilesHigh = h;
			mTilesWide = w;
			mInternalMap = new Array(w);
			for (var tx:Number = 0; tx < w; tx++)
			{
				mInternalMap[tx] = new Array(h);
				for (var ty:Number = 0; ty < h; ty++)
				{
					mInternalMap[tx][ty] = new Array();
				}
			}
			var blk:Block;
			for (var x:int = 0; x <= w; x++)
			{
				for (var y:int = 0; y <= h; y++)
				{
					blk = Utils.getBlock(0);
					pushBlock(blk, x, y);
				}
			}
			moveBy(ox,oy);
		}
		
		public function mapToString():String
		{
			var output:String = mTilesWide + "." + mTilesHigh + ".";
			for (var tx:Number = 0; tx < mTilesWide; tx++)
			{
				for (var ty:Number = 0; ty < mTilesHigh; ty++)
				{
					for (var tz:Number = 0; tz < mInternalMap[tx][ty].length; tz++)
					{
						output += Utils.getNumberAsHexString(mInternalMap[tx][ty][tz].block_type, 3, false);
					}
					output += ".";
				}
			}
			return output;
		}
		
		public function setBlockController(blockController:BlockController)
		{
			mBlockController = blockController;
		}
		
		public function setMode(mode:String)
		{
			mMode = mode;
		}
		
		public function pushBlock(bl:Block, x:int, y:int)
		{
			if (!bl)
				return;
				
			if (x >= mTilesWide || y >= mTilesHigh)
				return;
				
			bl.tile_x = x;
			bl.tile_y = y;
			bl.tile_z = mInternalMap[x][y].length;
			mInternalMap[x][y].push(bl);
			regenerateLocalShadows(x, y, true);
		}
		
		public function regenerateLocalShadows(x:int, y:int, repeat:Boolean):void
		{
			if (!mInternalMap[x])
				return;
			if (!mInternalMap[x][y])
				return;
			if (mInternalMap[x][y].length == 0)
				return;
				
			mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.removeAll();
			if (mInternalMap[x][y].length > 1)
			{
				mInternalMap[x][y][mInternalMap[x][y].length - 2].shadows.removeAll();
			}
							
			if (x > 0)
			{
				if (mInternalMap[x - 1])
				{
					if (mInternalMap[x][y].length < mInternalMap[x - 1][y].length)
					{
						mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_West));
					}
					if (y > 0)
					{
						if (mInternalMap[x - 1][y - 1])
						{
							if (mInternalMap[x][y].length < mInternalMap[x - 1][y - 1].length && mInternalMap[x][y].length > mInternalMap[x][y - 1].length)
							{
								mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_North_West));
							}
						}
					}
					if (y < mTilesHigh)
					{
						if (mInternalMap[x - 1][y + 1])
						{
							if (mInternalMap[x][y].length < mInternalMap[x - 1][y + 1].length)
							{
								mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_South_West));
							}
						}
					}
				}
			}
			if (x < mTilesWide)
			{
				if (mInternalMap[x + 1])
				{
					if (mInternalMap[x][y].length < mInternalMap[x + 1][y].length)
					{
						mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_East));
					}
					if (y > 0)
					{
						if (mInternalMap[x][y].length < mInternalMap[x + 1][y - 1].length && mInternalMap[x][y].length > mInternalMap[x][y - 1].length)
						{
							mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_North_East));
						}
					}
					if (y < mTilesHigh && mInternalMap[x+1][y+1])
					{
						if (mInternalMap[x + 1][y + 1])
						{
							if (mInternalMap[x][y].length < mInternalMap[x + 1][y + 1].length)
							{
								mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_South_East));
							}
						}
					}
					/*if (mInternalMap[x - 1])
					{
						if (mInternalMap[x - 1][y + 1])
						{
							for (var iz:Number = 0; iz < mInternalMap[x][y].length; iz++ )
							{
								if (mInternalMap[x - 1][y+1][iz])
								{
									mInternalMap[x][y][iz].shadows.add(new Image(CuteAssets.Shadow_Side_West))
								}
							}
						}
					}*/
				}
			}
			if (mInternalMap[x][y - 1])
			{
				if(mInternalMap[x][y].length < mInternalMap[x ][y - 1].length)
				{
					mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_North));
				}
			}
			if (mInternalMap[x][y + 1])
			{
				if (mInternalMap[x][y].length < mInternalMap[x][y + 1].length)
				{
					mInternalMap[x][y][mInternalMap[x][y].length - 1].shadows.add(new Image(CuteAssets.Shadow_South));
				}
			}
			if (repeat)
			{
				regenerateLocalShadows(x, y + 1, false);
				regenerateLocalShadows(x, y - 1, false);
				regenerateLocalShadows(x-1, y + 1, false);
				regenerateLocalShadows(x-1, y, false);
				regenerateLocalShadows(x-1, y - 1, false);
				regenerateLocalShadows(x+1, y + 1, false);
				regenerateLocalShadows(x+1, y, false);
				regenerateLocalShadows(x+1, y - 1, false);
			}
		}
		
		public function isEmpty(x:int, y:int)
		{
			return mInternalMap[x][y].length == 0;
		}
		
		override public function render():void
		{
			super.render();
			var layerInc:Number = 3000;
			var ix:Number;
			var iy:Number;
			var iz:Number;
			var actX:Number;
			var actY:Number;
			for (ix = 0; ix < mTilesHigh; ix ++)
			{
				for (iy = 0; iy < mTilesWide; iy ++)
				{
					for (iz = 0; iz < mInternalMap[ix][iy].length; iz ++)
					{
						mInternalMap[ix][iy][iz].layer = layerInc;
						layerInc--;
						mInternalMap[ix][iy][iz].x = this.x+(ix * 35);
						mInternalMap[ix][iy][iz].y = this.y+(iy * 28)-(iz*15)-10;
						mInternalMap[ix][iy][iz].render();
						if (iz == mCursor.tileZ && iy == mCursor.tileY && ix == mCursor.tileX && mCursor.present)
						{
							switch(mMode)
							{
								case "stacking":
									mCursor.graphic = new Image(CuteAssets.Minus_Block);
									break;
								case "placing":
									mCursor.graphic = Utils.getBlock(mBlockController.pullBlockType()).graphic;
									(Image)(mCursor.graphic).alpha = 0.8;
									break;
							}
							mCursor.render();
						}
					}
				}
			}
		}
		
		override public function update():void
		{
			super.update();
			mCursor.present = false;
			var relMouseX:Number = Input.mouseX - x;
			var relMouseY:Number = Input.mouseY - y;
			if (relMouseX > 0 && relMouseX < 350 && relMouseY < 300)
			{
				var ix:Number = mTilesWide - 1;
				var iy:Number = mTilesHigh - 1;
				var touched:Boolean = false;
				while(!touched)
				{
					if (mInternalMap[ix][iy][mInternalMap[ix][iy].length - 1].mouseHitTest())
					{
						if (Input.mouseReleased)
						{
							switch(mMode)
							{
								case "stacking":
									if (mBlockController.canPushBlock())
									{
										if (mInternalMap[ix][iy].length > 1)
										{
											SfxController.play('dig');
											mBlockController.pushBlock(mInternalMap[ix][iy].pop());
											regenerateLocalShadows(ix, iy, true);
										}
									}
									break;
								case "placing":
									if (mBlockController.canPullBlock())
									{
										SfxController.play('drop');
										pushBlock(mBlockController.pullBlock(), ix, iy);
									}
									break;
							}
						}
						mCursor.present = true;
						mCursor.x = mInternalMap[ix][iy][mInternalMap[ix][iy].length - 1].x;
						mCursor.y = mInternalMap[ix][iy][mInternalMap[ix][iy].length - 1].y;
						if (mMode == "placing")
						{
							mCursor.y -= 15;
						}
						mCursor.tileX = ix;
						mCursor.tileY = iy;
						mCursor.tileZ = mInternalMap[ix][iy].length - 1;
						touched = true;
					}
					
					iy--;
					if (iy < 0)
					{
						iy = mTilesHigh - 1;
						ix--;
						if (ix < 0)
						{
							break;
						}
					}
				}
			}
		}
		
		public function rotateView(by:int):void
		{			
			SfxController.play('rotate');
			var ix:Number;
			var iy:Number;
			var iz:Number;
			var actX:Number;
			var actY:Number;
			switch(by)
			{
				case 1:
					mTransmap = new Array(mTilesWide);
					for (iy = 0; iy < mTilesHigh; iy ++)
					{
						mTransmap[iy] = new Array(mTilesHigh);
						for (ix = mTilesWide-1; ix >= 0; ix--)
						{
							actX = mTilesWide - ix - 1;
							mTransmap[iy][actX] = new Array();
							for (iz = 0; iz < mInternalMap[ix][iy].length; iz ++)
							{
								switch(mInternalMap[ix][iy][iz].block_type)
								{
									case 1001:
										mTransmap[iy][actX].push(Utils.getBlock(1004));
										break;
									case 1002:
										mTransmap[iy][actX].push(Utils.getBlock(1001));
										break;
									case 1003:
										mTransmap[iy][actX].push(Utils.getBlock(1002));
										break;
									case 1004:
										mTransmap[iy][actX].push(Utils.getBlock(1003));
										break;
									case 1005:
										mTransmap[iy][actX].push(Utils.getBlock(1008));
										break;
									case 1006:
										mTransmap[iy][actX].push(Utils.getBlock(1005));
										break;
									case 1007:
										mTransmap[iy][actX].push(Utils.getBlock(1006));
										break;
									case 1008:
										mTransmap[iy][actX].push(Utils.getBlock(1007));
										break;
									case 1009:
										mTransmap[iy][actX].push(Utils.getBlock(10012));
										break;
									case 1010:
										mTransmap[iy][actX].push(Utils.getBlock(1009));
										break;
									case 1011:
										mTransmap[iy][actX].push(Utils.getBlock(1010));
										break;
									case 1012:
										mTransmap[iy][actX].push(Utils.getBlock(1011));
										break;
									default:
										mTransmap[iy][actX].push(mInternalMap[ix][iy][iz]);
										break;
								}
							}
						}
					}
					mInternalMap = mTransmap;
					break;
				case -1:
					mTransmap = new Array(mTilesWide);
					for (iy = mTilesHigh-1; iy >= 0; iy --)
					{
						actY = mTilesHigh - iy - 1;
						mTransmap[actY] = new Array(mTilesHigh);
						for (ix = 0; ix < mTilesHigh; ix ++)
						{
							mTransmap[actY][ix] = new Array();
							for (iz = 0; iz < mInternalMap[ix][iy].length; iz ++)
							{
								switch(mInternalMap[ix][iy][iz].block_type)
								{
									case 1001:
										mTransmap[actY][ix].push(Utils.getBlock(1002));
										break;
									case 1002:
										mTransmap[actY][ix].push(Utils.getBlock(1003));
										break;
									case 1003:
										mTransmap[actY][ix].push(Utils.getBlock(1004));
										break;
									case 1004:
										mTransmap[actY][ix].push(Utils.getBlock(1001));
										break;
									case 1005:
										mTransmap[actY][ix].push(Utils.getBlock(1006));
										break;
									case 1006:
										mTransmap[actY][ix].push(Utils.getBlock(1007));
										break;
									case 1007:
										mTransmap[actY][ix].push(Utils.getBlock(1008));
										break;
									case 1008:
										mTransmap[actY][ix].push(Utils.getBlock(1005));
										break;
									case 1009:
										mTransmap[actY][ix].push(Utils.getBlock(1010));
										break;
									case 1010:
										mTransmap[actY][ix].push(Utils.getBlock(1011));
										break;
									case 1011:
										mTransmap[actY][ix].push(Utils.getBlock(1012));
										break;
									case 1012:
										mTransmap[actY][ix].push(Utils.getBlock(1009));
										break;
									default:
										mTransmap[actY][ix].push(mInternalMap[ix][iy][iz]);
										break;
								}
							}
						}
					}
					mInternalMap = mTransmap;
					break;
			}
			
			for (var ix:Number = 0; ix < mTilesHigh; ix ++)
			{
				for (var iy:Number = 0; iy < mTilesWide; iy ++)
				{
					regenerateLocalShadows(ix, iy, false);
				}
			}
		}
		
	}

}