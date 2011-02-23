package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	public class MatrixNewRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var nv1 : Vector3D;
		private var nv2 : Vector3D;
		private var d : Number;

		public function MatrixNewRotationTest()
		{
			name = "MatrixNewRotationTest";
			description = "Comparing newRotation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newRotationMatrixNative, null, "newRotationMatrixNative", 0, 1, "new Matrix3D().appendRotation( angle, axis, point )" ), 
			];

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

		public function newRotationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3D = new Matrix3D();
				m.appendRotation( d, nv1, nv2 );
			}
		}
	}
}
