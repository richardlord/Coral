package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorDecrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorDecrementTest()
		{
			name = "VectorDecrementTest";
			description = "Comparing decrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( decrementVectorNative, null, "decrementVectorNative", 0, 1, "Vector3D.decrementBy( v )" ), 
				];

			n1 = new Vector3D( 100000, 100000, 100000 );
			n2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function decrementVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.decrementBy( n2 );
			}
		}
	}
}
