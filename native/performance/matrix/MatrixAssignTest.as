package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixAssignTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Matrix3D;
		private var n2 : Matrix3D;
		private var n3 : Matrix3D;

		public function MatrixAssignTest()
		{
			name = "MatrixAssignTest";
			description = "Comparing assign on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( assignMatrixNative, null, "assignMatrixNative", 0, 1, "m1.rawData = m2.rawData" ), 
			];

			n1 = new Matrix3D();
			n2 = Utils.randomMatrix();
			n3 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function assignMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.rawData = n2.rawData;
				n1.rawData = n3.rawData;
			}
		}
	}
}
