package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorDivideByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var s : Number;

		public function VectorDivideByTest()
		{
			name = "VectorDivideByTest";
			description = "Comparing divideBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( divideByVectorNative, null, "divideByVectorNative", 0, 1, "Vector3D.scaleBy( 1 / s )" ), 
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

		public function divideByVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.scaleBy( 1 / s );
			}
		}
	}
}
