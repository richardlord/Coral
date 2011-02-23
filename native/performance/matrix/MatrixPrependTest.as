package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixPrependTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var n1 : Matrix3D;
		private var n2 : Matrix3D;

		public function MatrixPrependTest()
		{
			name = "MatrixPrependTest";
			description = "Comparing prepend on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( prependMatrixNative, null, "prependMatrixNative", 0, 1, "Matrix3D.prepend( m )" ), 
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

		public function prependMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.prepend( n2 );
			}
		}
	}
}
