package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;

	public class MatrixTransformPointsTest extends TestSuite
	{
		private var loops : uint = 100000;
		
		private var n1 : Matrix3D;
		private var nv1 : Vector.<Number>;
		private var nv2 : Vector.<Number>;
		private var length : uint = 30;

		public function MatrixTransformPointsTest()
		{
			name = "MatrixTransformPointsTest";
			description = "Comparing transformPoints on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformVectorsMatrixNative, null, "transformVectorsMatrixNative", 0, 1, "Matrix3D.transformVectors( v, r )" ), 
			];

			n1 = Utils.randomMatrix();
			nv1 = new Vector.<Number>();
			for( var i : uint = 0; i < length; ++i )
			{
				nv1.push( Utils.randomNumber(), Utils.randomNumber(), Utils.randomNumber() );
			}
			nv2 = new Vector.<Number>( length * 3 );
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformVectorsMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.transformVectors( nv1, nv2 );
			}
		}
	}
}
