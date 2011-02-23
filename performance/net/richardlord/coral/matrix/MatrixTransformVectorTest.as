package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixTransformVectorTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var m1 : Matrix3d;
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function MatrixTransformVectorTest()
		{
			name = "MatrixTransformVectorTest";
			description = "Comparing transformVector on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformVectorMatrix, null, "transformVectorMatrix", 0, 1, "Matrix3d.transformVector( v )" ), 
				new MethodTest( transformVectorMatrix2, null, "transformVectorMatrix2", 0, 1, "Matrix3d.transformVector( v, r )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = Utils.randomVector();
			v2 = new Vector3d();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformVectorMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3d = m1.transformVector( v1 );
			}
		}

		public function transformVectorMatrix2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformVector( v1, v2 );
			}
		}
	}
}
