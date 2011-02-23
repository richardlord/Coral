package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixAppendScaleTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var m1 : Matrix3d;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixAppendScaleTest()
		{
			name = "MatrixAppendScaleTest";
			description = "Comparing appendScale on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendScaleMatrix, null, "appendScaleMatrix", 0, 1, "Matrix3d.appendScale( x, y, z )" ), 
			];

			m1 = Utils.randomMatrix();
			
			x = Utils.randomNumber();
			y = Utils.randomNumber();
			z = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function appendScaleMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.appendScale( x, y, z );
			}
		}
	}
}
