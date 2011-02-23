package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	public class MatrixPrependRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Matrix3D;
		private var nv1 : Vector3D;
		private var nv2 : Vector3D;
		private var d : Number;

		public function MatrixPrependRotationTest()
		{
			name = "MatrixPrependRotationTest";
			description = "Comparing prependRotation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( prependRotationMatrixNative, null, "prependRotationMatrixNative", 0, 1, "Matrix3D.prependRotation( angle, axis, point )" ), 
			];

			n1 = Utils.randomMatrix();
			nv1 = Utils.randomVector();
			nv2 = Utils.randomVector();
			d = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function prependRotationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.prependRotation( d, nv1, nv2 );
			}
		}
	}
}
