package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixNewBasisTransformTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function MatrixNewBasisTransformTest()
		{
			name = "MatrixNewBasisTransformTest";
			description = "Comparing newBasisTransform on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newBasisTransformMatrix, null, "newBasisTransformMatrix", 0, 1, "Matrix3d.newBasisTransform( v1, v2, v3 )" ), 
			];

			v1 = Utils.randomVector();
			v2 = Utils.randomVector();
			v3 = Utils.randomVector();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function newBasisTransformMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var m:Matrix3d = Matrix3d.newBasisTransform( v1, v2, v3 );
			}
		}
	}
}
