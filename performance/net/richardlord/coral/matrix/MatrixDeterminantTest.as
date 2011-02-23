package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixDeterminantTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;

		public function MatrixDeterminantTest()
		{
			name = "MatrixDeterminantTest";
			description = "Comparing determinant on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( determinantMatrix, null, "determinantMatrix", 0, 1, "Matrix3d.determinant" ), 
			];

			m1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function determinantMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var d : Number = m1.determinant;
			}
		}
	}
}
