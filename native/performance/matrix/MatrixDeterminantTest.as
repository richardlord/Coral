package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixDeterminantTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;

		public function MatrixDeterminantTest()
		{
			name = "MatrixDeterminantTest";
			description = "Comparing determinant on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( determinantMatrixNative, null, "determinantMatrixNative", 0, 1, "Matrix3D.determinant" ), 
			];

			n1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function determinantMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var d : Number = n1.determinant;
			}
		}
	}
}
