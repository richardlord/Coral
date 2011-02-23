package net.richardlord.coral
{
	public class Utils
	{
		public static function randomNumber() : Number
		{
			return Math.random() * 20 - 10;
		}
		
		public static function randomVector16() : Vector.<Number>
		{
			var v : Vector.<Number> = new Vector.<Number>( 16 );
			for( var i:uint = 0; i < 16; ++i )
			{
				v[i] = randomNumber();
			}
			return v;
		}
		
		public static function randomVector() : Vector3d
		{
			return new Vector3d( randomNumber(), randomNumber(), randomNumber() );
		}
		
		public static function randomPoint() : Point3d
		{
			return new Point3d( randomNumber(), randomNumber(), randomNumber() );
		}
		
		public static function randomMatrix() : Matrix3d
		{
			return new Matrix3d(
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber()
			);
		}
		
		public static function randomQuaternion() : Quaternion
		{
			return new Quaternion( randomNumber(), randomNumber(), randomNumber(), randomNumber() );
		}
	}
}
