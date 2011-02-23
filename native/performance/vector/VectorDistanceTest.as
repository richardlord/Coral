package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorDistanceTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorDistanceTest()
		{
			name = "VectorDistanceTest";
			description = "Comparing distance on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( distanceVectorNative, null, "distanceVectorNative", 0, 1, "Vector3D.subtract( v ).length" ), 
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

		public function distanceVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = n1.subtract( n2 ).length;
			}
		}
	}
}
