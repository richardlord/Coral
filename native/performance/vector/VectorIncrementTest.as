package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorIncrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorIncrementTest()
		{
			name = "VectorIncrementTest";
			description = "Comparing incrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( incrementVectorNative, null, "incrementVectorNative", 0, 1, "Vector3D.incrementBy( v )" ), 
				];

			n1 = new Vector3D();
			n2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function incrementVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.incrementBy( n2 );
			}
		}
	}
}
