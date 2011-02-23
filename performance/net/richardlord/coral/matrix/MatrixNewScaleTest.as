package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixNewScaleTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function MatrixNewScaleTest()
		{
			name = "MatrixNewScaleTest";
			description = "Comparing newScale on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newScaleMatrix, null, "newScaleMatrix", 0, 1, "Matrix3d.newScale( x, y, z )" ), 
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

		public function newScaleMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3d = Matrix3d.newScale( x, y, z );
			}
		}
	}
}
