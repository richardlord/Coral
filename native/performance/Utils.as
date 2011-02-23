package performance
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	
	public class Utils
	{
		public static function randomNumber() : Number
		{
			return Math.random() * 20 - 10;
		}
		
		public static function randomVector() : Vector3D
		{
			return new Vector3D( randomNumber(), randomNumber(), randomNumber() );
		}
		
		public static function randomVector16() : Vector.<Number>
		{
			var v : Vector.<Number> = new Vector.<Number>( 16 );
			for( var i:uint = 0; i < 16; ++i )
			{
				v[i] = Utils.randomNumber();
			}
			return v;
		}
		
		public static function randomMatrix() : Matrix3D
		{
			return new Matrix3D( randomVector16() );
		}
	}
}
