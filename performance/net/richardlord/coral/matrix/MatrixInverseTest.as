package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixInverseTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;
		private var m2 : Matrix3d;

		public function MatrixInverseTest()
		{
			name = "MatrixInverseTest";
			description = "Comparing inverse on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( inverseMatrix, null, "inverseMatrix", 0, 1, "Matrix3d.inverse()" ), 
				new MethodTest( inverseMatrix2, null, "inverseMatrix2", 0, 1, "Matrix3d.inverse( r )" ), 
			];

			m1 = Utils.randomMatrix();
			m2 = new Matrix3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function inverseMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3d = m1.inverse();
			}
		}

		public function inverseMatrix2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.inverse( m2 );
			}
		}
	}
}
