package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixNewTranslationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixNewTranslationTest()
		{
			name = "MatrixNewTranslationTest";
			description = "Comparing newTranslation on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newTranslationMatrix, null, "newTranslationMatrix", 0, 1, "Matrix3d.newTranslation( x, y, z )" ), 
			];

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

		public function newTranslationMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3d = Matrix3d.newTranslation( x, y, z );
			}
		}
	}
}
