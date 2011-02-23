package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixPrependRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;
		private var v1 : Vector3d;
		private var p1 : Point3d;
		private var r : Number;

		public function MatrixPrependRotationTest()
		{
			name = "MatrixPrependRotationTest";
			description = "Comparing prependRotation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( prependRotationMatrix, null, "prependRotationMatrix", 0, 1, "Matrix3d.prependRotation( angle, axis, point )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = Utils.randomVector();
			p1 = Utils.randomPoint();
			r = Utils.randomNumber();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function prependRotationMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.prependRotation( r, v1, p1 );
			}
		}
	}
}
