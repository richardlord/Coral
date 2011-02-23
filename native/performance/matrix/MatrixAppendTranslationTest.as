package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixAppendTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixAppendTranslationTest()
		{
			name = "MatrixAppendTranslationTest";
			description = "Comparing appendTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendTranslationMatrixNative, null, "appendTranslationMatrixNative", 0, 1, "Matrix3D.appendTranslation( x, y, z )" ), 
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

		public function appendTranslationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.appendTranslation( x, y, z );
			}
		}
	}
}
