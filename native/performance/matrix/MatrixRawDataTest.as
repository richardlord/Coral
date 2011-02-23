package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixRawDataTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v : Vector.<Number>;
		private var n1 : Matrix3D;
		private var n2 : Matrix3D;

		public function MatrixRawDataTest()
		{
			name = "MatrixRawDataTest";
			description = "Comparing rawData on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( getRawDataMatrixNative, null, "getRawDataMatrixNative", 0, 1, "Matrix3D.rawData" ), 
				new MethodTest( setRawDataMatrixNative, null, "setRawDataMatrixNative", 0, 1, "Matrix3D.rawData = v" ), 
			];

			v = Utils.randomVector16();
			n1 = Utils.randomMatrix();
			n2 = new Matrix3D();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function getRawDataMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector.<Number> = n1.rawData;
			}
		}

		public function setRawDataMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n2.rawData = v;
			}
		}
	}
}
