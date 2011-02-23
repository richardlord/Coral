package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixAppendTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Matrix3D;
		private var n2 : Matrix3D;

		public function MatrixAppendTest()
		{
			name = "MatrixAppendTest";
			description = "Comparing append on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendMatrixNative, null, "appendMatrixNative", 0, 1, "Matrix3D.append( m )" ), 
			];

			n1 = Utils.randomMatrix();
			n2 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function appendMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.append( n2 );
			}
		}
	}
}
