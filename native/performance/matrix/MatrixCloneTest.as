package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixCloneTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;

		public function MatrixCloneTest()
		{
			name = "MatrixCloneTest";
			description = "Comparing clone on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( cloneMatrixNative, null, "cloneMatrixNative", 0, 1, "Matrix3D.clone()" ), 
			];

			n1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function cloneMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3D = n1.clone();
			}
		}
	}
}
