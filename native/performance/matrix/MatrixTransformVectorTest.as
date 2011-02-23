package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	public class MatrixTransformVectorTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var n1 : Matrix3D;
		private var nv1 : Vector3D;

		public function MatrixTransformVectorTest()
		{
			name = "MatrixTransformVectorTest";
			description = "Comparing transformVector on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( deltaTransformVectorMatrixNative, null, "deltaTransformVector", 0, 1, "Matrix3D.deltaTransformVector( v )" ), 
			];

			n1 = Utils.randomMatrix();
			nv1 = Utils.randomVector();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function deltaTransformVectorMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.deltaTransformVector( nv1 );
			}
		}
	}
}
