package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixPrependTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixPrependTranslationTest()
		{
			name = "MatrixPrependTranslationTest";
			description = "Comparing prependTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( prependTranslationMatrixNative, null, "prependTranslationMatrixNative", 0, 1, "Matrix3D.prependTranslation( x, y, z )" ), 
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

		public function prependTranslationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.prependTranslation( x, y, z );
			}
		}
	}
}
