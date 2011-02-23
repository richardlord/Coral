package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixAppendTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var m1 : Matrix3d;
		private var m2 : Matrix3d;

		public function MatrixAppendTest()
		{
			name = "MatrixAppendTest";
			description = "Comparing append on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendMatrix, null, "appendMatri", 0, 1, "Matrix3d.append( m )" ), 
			];

			m1 = Utils.randomMatrix();
			m2 = Utils.randomMatrix();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function appendMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.append( m2 );
			}
		}
	}
}
