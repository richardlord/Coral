package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorUnitTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;

		public function VectorUnitTest()
		{
			name = "VectorUnitTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( unitVectorNative, null, "unitVectorNative", 0, 1, "Vector3D.clone().normalize()" ), 
			];
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1 = Utils.randomVector();
			}
		}

		public function unitVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1 = Utils.randomVector();
				var v : Vector3D = n1.clone();
				v.normalize();
			}
		}
	}
}
