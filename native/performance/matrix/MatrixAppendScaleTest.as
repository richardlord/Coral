package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixAppendScaleTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixAppendScaleTest()
		{
			name = "MatrixAppendScaleTest";
			description = "Comparing appendScale on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendScaleMatrixNative, null, "appendScaleMatrixNative", 0, 1, "Matrix3D.appendScale( x, y, z )" ), 
			];

			n1 = Utils.randomMatrix();
			x = Utils.randomNumber();
			y = Utils.randomNumber();
			z = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function appendScaleMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.appendScale( x, y, z );
			}
		}
	}
}
