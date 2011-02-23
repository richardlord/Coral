package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorNegativeTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;

		public function VectorNegativeTest()
		{
			name = "VectorNegativeTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( negativeVectorNative, null, "negativeVectorNative", 0, 1, "Vector3D.clone().negate()" ), 
			];

			n1 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function negativeVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.clone();
				v.negate();
			}
		}
	}
}
