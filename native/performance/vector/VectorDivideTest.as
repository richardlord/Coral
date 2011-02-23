package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorDivideTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var s : Number;

		public function VectorDivideTest()
		{
			name = "VectorDivideTest";
			description = "Comparing divide on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( divideVectorNative, null, "divideVectorNative", 0, 1, "Vector3D.clone().scaleBy( 1 / s )" ), 
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

		public function divideVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v:Vector3D = n1.clone();
				v.scaleBy( 1 / s );
			}
		}
	}
}
