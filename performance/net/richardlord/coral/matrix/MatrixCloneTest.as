package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixCloneTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var m1 : Matrix3d;

		public function MatrixCloneTest()
		{
			name = "MatrixCloneTest";
			description = "Comparing clone on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( cloneMatrix, null, "cloneMatrix", 0, 1, "Matrix3d.clone()" ), 
			];

			m1 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function cloneMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3d = m1.clone();
			}
		}
	}
}
