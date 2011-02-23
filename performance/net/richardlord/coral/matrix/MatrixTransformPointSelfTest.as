package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class MatrixTransformPointSelfTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;
		private var v1 : Point3d;

		public function MatrixTransformPointSelfTest()
		{
			name = "MatrixTransformPointSelfTest";
			description = "Comparing transformPointSelf on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformPointSelfMatrix, null, "transformPointSelfMatrix", 0, 1, "Matrix3d.transformPointSelf( v )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = Utils.randomPoint();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformPointSelfMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformPointSelf( v1 );
			}
		}
	}
}
