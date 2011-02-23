package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorScaleByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var s : Number;

		public function VectorScaleByTest()
		{
			name = "VectorScaleByTest";
			description = "Comparing scaleByBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( scaleByVectorNative, null, "scaleByVectorNative", 0, 1, "Vector3D.scaleBy( s )" ), 
				];

			n1 = Utils.randomVector();
			s = Utils.randomNumber();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function scaleByVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.scaleBy( s );
			}
		}
	}
}
