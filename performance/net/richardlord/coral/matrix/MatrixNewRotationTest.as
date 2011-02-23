package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixNewRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var v1 : Vector3d;
		private var p1 : Point3d;
		private var r : Number;

		public function MatrixNewRotationTest()
		{
			name = "MatrixNewRotationTest";
			description = "Comparing newRotation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newRotationMatrix, null, "newRotationMatrix", 0, 1, "Matrix3d.newRotation( angle, axis, point )" ), 
			];

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

		public function newRotationMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3d = Matrix3d.newRotation( r, v1, p1 );
			}
		}
	}
}
