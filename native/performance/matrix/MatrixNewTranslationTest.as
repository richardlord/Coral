package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixNewTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixNewTranslationTest()
		{
			name = "MatrixNewTranslationTest";
			description = "Comparing newTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newTranslationMatrixNative, null, "newTranslationMatrixNative", 0, 1, "new Matrix3D().appendTranslation( x, y, z )" ), 
			];

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

		public function newTranslationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3D = new Matrix3D();
				m.appendTranslation( x, y, z );
			}
		}
	}
}
