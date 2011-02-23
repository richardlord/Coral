package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorDotProductTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorDotProductTest()
		{
			name = "VectorDotProductTest";
			description = "Comparing dotProduct on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( dotProductVectorNative, null, "dotProductVectorNative", 0, 1, "Vector3D.dotProduct( v )" ), 
				];

			n1 = Utils.randomVector();
			n2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function dotProductVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s:Number = n1.dotProduct( n2 );
			}
		}
	}
}
