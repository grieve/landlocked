package com.rushthefence.landlocked 
{
	import com.rushthefence.landlocked.blocks.*;
	/**
	 * ...
	 * @author Ryan Grieve
	 */
	public class Utils 
	{
		public static function getBlock(blockType:int):Block
		{
			if (blockType > 8 && blockType < 1000)
			{
				blockType += 992;
			}
			switch(blockType)
			{
				case 0:
					return new E_Plain();
					break;
				case 1:
					return new E_Stone();
					break;
				case 2:
					return new E_Brown();
					break;
				case 3:
					return new E_Dirt();
					break;
				case 4:
					return new E_Grass();
					break;
				case 5:
					return new E_Wood();
					break;
				case 6:
					return new E_Wall();
					break;
				case 7:
					return new E_Water();
					break;
				case 8:
					return new E_Glass();
					break;
				case 1001:
					return new E_RampNorth();
					break;
				case 1002:
					return new E_RampEast();
					break;
				case 1003:
					return new E_RampSouth();
					break;
				case 1004:
					return new E_RampWest();
					break;
				case 1005:
					return new E_RoofNorth();
					break;
				case 1006:
					return new E_RoofEast();
					break;
				case 1007:
					return new E_RoofSouth();
					break;
				case 1008:
					return new E_RoofWest();
					break;
				case 1009:
					return new E_RoofNorthEast();
					break;
				case 1010:
					return new E_RoofSouthEast();
					break;
				case 1011:
					return new E_RoofSouthWest();
					break;
				case 1012:
					return new E_RoofNorthWest();
					break;
				default:
					return new E_Plain();
					break;
			}
		}
		public static function getNumberAsHexString(number:uint, minimumLength:uint = 1, showHexDenotation:Boolean = true):String
		{
			var string:String = number.toString(16).toUpperCase();
			while (minimumLength > string.length)
			{
					string = "0" + string;
			}
			if (showHexDenotation) { string = "0x" + string; }
			return string;
        }
	}

}