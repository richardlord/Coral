package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class MatrixTransformPointTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var m1 : Matrix3d;
		private var v1 : Point3d;
		private var v2 : Point3d;

		public function MatrixTransformPointTest()
		{
			name = "MatrixTransformPointTest";
			description = "Comparing transformPoint on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformPointMatrix, null, "transformPointMatrix", 0, 1, "Matrix3d.transformPoint( v )" ), 
				new MethodTest( transformPointMatrix2, null, "transformPointMatrix2", 0, 1, "Matrix3d.transformPoint( v, r )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = Utils.randomPoint();
			v2 = new Point3d();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformPointMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Point3d = m1.transformPoint( v1 );
			}
		}

		public function transformPointMatrix2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformPoint( v1, v2 );
			}
		}
	}
}
