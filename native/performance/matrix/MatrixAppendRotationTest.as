package performance.matrix
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	public class MatrixAppendRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m : Matrix3D;
		private var v : Vector3D;
		private var p : Vector3D;
		private var d : Number;

		public function MatrixAppendRotationTest()
		{
			name = "MatrixAppendRotationTest";
			description = "Comparing appendRotation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendRotationMatrixNative, null, "appendRotationMatrixNative", 0, 1, "Matrix3D.appendRotation( angle, axis, point )" ), 
			];

			m = Utils.randomMatrix();
			v = Utils.randomVector();
			p = Utils.randomVector();
			d = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function appendRotationMatrixNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m.appendRotation( d, v, p );
			}
		}
	}
}
