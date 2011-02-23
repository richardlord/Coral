package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixNewScaleTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixNewScaleTest()
		{
			name = "MatrixNewScaleTest";
			description = "Comparing newScale on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newScaleMatrixNative, null, "newScaleMatrixNative", 0, 1, "new Matrix3D().appendScale( x, y, z )" ), 
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

		public function newScaleMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3D = new Matrix3D();
				m.appendScale( x, y, z );
			}
		}
	}
}
