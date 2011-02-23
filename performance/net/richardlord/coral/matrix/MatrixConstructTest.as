package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n11 : Number;
		private var n12 : Number;
		private var n13 : Number;
		private var n14 : Number;
		private var n21 : Number;
		private var n22 : Number;
		private var n23 : Number;
		private var n24 : Number;
		private var n31 : Number;
		private var n32 : Number;
		private var n33 : Number;
		private var n34 : Number;
		private var n41 : Number;
		private var n42 : Number;
		private var n43 : Number;
		private var n44 : Number;

		public function MatrixConstructTest()
		{
			name = "MatrixConstructTest";
			description = "Comparing construction on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createMatrixEmpty, null, "CreateMatrixEmpty", 0, 1, "new Matrix3d()" ), 
				new MethodTest( createMatrix, null, "CreateMatrix", 0, 1, "new Matrix3d( n11, n12, ... )" ), 
			];

			n11 = Utils.randomNumber();
			n12 = Utils.randomNumber();
			n13 = Utils.randomNumber();
			n14 = Utils.randomNumber();
			n21 = Utils.randomNumber();
			n22 = Utils.randomNumber();
			n23 = Utils.randomNumber();
			n24 = Utils.randomNumber();
			n31 = Utils.randomNumber();
			n32 = Utils.randomNumber();
			n33 = Utils.randomNumber();
			n34 = Utils.randomNumber();
			n41 = Utils.randomNumber();
			n42 = Utils.randomNumber();
			n43 = Utils.randomNumber();
			n44 = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function createMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3d = new Matrix3d(
					n11, n12, n13, n14,
					n21, n22, n23, n24,
					n31, n32, n33, n34,
					n41, n42, n43, n44
				);
			}
		}

		public function createMatrixEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m : Matrix3d = new Matrix3d();
			}
		}
	}
}
