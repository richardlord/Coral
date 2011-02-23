package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixAppendTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var m1 : Matrix3d;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixAppendTranslationTest()
		{
			name = "MatrixAppendTranslationTest";
			description = "Comparing appendTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendTranslationMatrix, null, "appendTranslationMatrix", 0, 1, "Matrix3d.appendTranslation( x, y, z )" ), 
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

		public function appendTranslationMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.appendTranslation( x, y, z );
			}
		}
	}
}
