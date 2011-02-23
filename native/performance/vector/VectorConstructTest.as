package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function VectorConstructTest()
		{
			name = "VectorConstructTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createVectorNativeEmpty, null, "CreateVectorNativeEmpty", 0, 1, "new Vector3D()" ), 
				new MethodTest( createVectorNative, null, "CreateVectorNative", 0, 1, "new Vector3D( x, y, z )" ), 
			];

			x = Utils.randomNumber();
			y = Utils.randomNumber();
			z = Utils.randomNumber();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function createVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = new Vector3D( x, y, z );
			}
		}

		public function createVectorNativeEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = new Vector3D();
			}
		}
	}
}
