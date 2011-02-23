package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorLengthTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;

		public function VectorLengthTest()
		{
			name = "VectorLengthTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( lengthVectorNative, null, "lengthVectorNative", 0, 1, "Vector3D.length" ), 
			];

			n1 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function lengthVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = n1.length;
			}
		}
	}
}
