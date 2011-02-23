package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var m1 : Matrix3d;
		private var m2 : Matrix3d;
		private var m3 : Matrix3d;

		public function MatrixEqualsTest()
		{
			name = "MatrixEqualsTest";
			description = "Comparing equals on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( equalsMatrixSuccess, null, "equalsMatrixSuccess", 0, 1, "Matrix3d.equals true" ), 
				new MethodTest( equalsMatrixFailure, null, "equalsMatrixFailure", 0, 1, "Matrix3d.equals false" ), 
			];

			m1 = Utils.randomMatrix();
			m2 = m1.clone();
			m3 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function equalsMatrixSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.equals( m2 );
			}
		}

		public function equalsMatrixFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.equals( m3 );
			}
		}
	}
}
