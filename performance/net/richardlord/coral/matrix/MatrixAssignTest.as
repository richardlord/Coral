package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixAssignTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;
		private var m2 : Matrix3d;

		public function MatrixAssignTest()
		{
			name = "MatrixAssignTest";
			description = "Comparing assign on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( assignMatrix, null, "assignMatrix", 0, 1, "Matrix3d.assign( m )" ), 
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

		public function assignMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m2.assign( m1 );
			}
		}
	}
}
