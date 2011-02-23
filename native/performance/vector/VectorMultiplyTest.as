package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorMultiplyTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var s : Number;

		public function VectorMultiplyTest()
		{
			name = "VectorMultiplyTest";
			description = "Comparing multiply on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( multiplyVectorNative, null, "multiplyVectorNative", 0, 1, "Vector3D.clone().scaleBy( s )" ), 
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

		public function multiplyVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.clone();
				v.scaleBy( s );
			}
		}
	}
}
