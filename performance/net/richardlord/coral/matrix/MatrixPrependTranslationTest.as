package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixPrependTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var m1 : Matrix3d;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixPrependTranslationTest()
		{
			name = "MatrixPrependTranslationTest";
			description = "Comparing prependTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( prependTranslationMatrix, null, "prependTranslationMatrix", 0, 1, "Matrix3d.prependTranslation( x, y, z )" ), 
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

		public function prependTranslationMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.prependTranslation( x, y, z );
			}
		}
	}
}
