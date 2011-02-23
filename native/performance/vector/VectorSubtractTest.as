package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorSubtractTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorSubtractTest()
		{
			name = "VectorSubtractTest";
			description = "Comparing subtract on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( subtractVectorNative, null, "subtractVectorNative", 0, 1, "Vector3D.subtract( v )" ), 
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

		public function subtractVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.subtract( n2 );
			}
		}
	}
}
