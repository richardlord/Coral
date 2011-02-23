package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixInvertTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Matrix3D;

		public function MatrixInvertTest()
		{
			name = "MatrixInvertTest";
			description = "Comparing invert on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( invertMatrixNative, null, "invertMatrixNative", 0, 1, "Matrix3D.invert()" ), 
			];

			n1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function invertMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.invert();
			}
		}
	}
}
