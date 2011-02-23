package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixInverseTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Matrix3D;

		public function MatrixInverseTest()
		{
			name = "MatrixInverseTest";
			description = "Comparing inverse on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( inverseMatrixNative, null, "inverseMatrixNative", 0, 1, "Matrix3D.clone().invert()" ), 
			];

			n1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function inverseMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3D = n1.clone();
				m.invert();
			}
		}
	}
}
