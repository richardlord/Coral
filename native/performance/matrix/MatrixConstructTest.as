package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v : Vector.<Number>;

		public function MatrixConstructTest()
		{
			name = "MatrixConstructTest";
			description = "Comparing construction on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createMatrixNativeEmpty, null, "CreateMatrixNativeEmpty", 0, 1, "new Matrix3D()" ), 
				new MethodTest( createMatrixNative, null, "CreateMatrixNative", 0, 1, "new Matrix3D( v )" ), 
			];

			v = Utils.randomVector16();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function createMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3D = new Matrix3D( v );
			}
		}

		public function createMatrixNativeEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3D = new Matrix3D();
			}
		}
	}
}
