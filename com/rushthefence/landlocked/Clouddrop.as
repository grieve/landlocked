package com.rushthefence.landlocked 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class Clouddrop extends Entity
	{
		[Embed(source = "assets/cloud_1.png")] private var CLOUD_1:Class;
		[Embed(source = "assets/cloud_2.png")] private var CLOUD_2:Class;
		[Embed(source = "assets/cloud_3.png")] private var CLOUD_3:Class;
		[Embed(source = "assets/cloud_4.png")] private var CLOUD_4:Class;
		
		private var mClouds:Graphiclist = new Graphiclist();
		private var mCloudSpeeds:Array = new Array();
		
		private var mDensity:Number = 0;
		private var mHeight:Number = 0;
		private var mWidth:Number = 0;
		private var mCloudArray:Array;
		private var mLastCloudCreated:Number = 0;
		
		public function Clouddrop(w:Number, h:Number, density:Number) 
		{
			mWidth = w;
			mHeight = h;
			mDensity = density;
			mCloudArray = [CLOUD_1, CLOUD_2, CLOUD_3, CLOUD_4];
			graphic = mClouds;
			
			//half populate
			for (var inc:Number = 0; inc < (Math.ceil(density/2)+1); inc ++)
			{
				var newCloud:Image = new Image(mCloudArray[Math.floor(Math.random() * 4)]);
				newCloud.x = Math.floor(Math.random() * 1000) - 300;
				newCloud.y = Math.floor(Math.random() * 700)-100;
				mClouds.add(newCloud);
				mCloudSpeeds.push(Math.floor(Math.random() * 20) + 60);
			}
		}
		
		override public function update():void
		{	
			if (mLastCloudCreated > 1)
			{
				if (mClouds.count < mDensity)
				{
					var newCloud:Image = new Image(mCloudArray[Math.floor(Math.random() * 4)])
					newCloud.x = -700;
					newCloud.y = Math.floor(Math.random() * 700)-100;
					mClouds.add(newCloud);
					mCloudSpeeds.push(Math.floor(Math.random() * 20) + 60);
					mLastCloudCreated = 0;
				}
			}
			else
			{
				mLastCloudCreated += FP.elapsed;
			}
			
			for (var ix:Number = 0; ix < mClouds.count; ix++)
			{
				if (mClouds.children[ix].x > mWidth)
				{
					mClouds.removeAt(ix);
					mCloudSpeeds.splice(ix, 1);
				}
				mClouds.children[ix].x += (mCloudSpeeds[ix]*FP.elapsed);
			}
		}
	}

}