package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixAppendBasisTransformTest extends TestSuite
	{
		private var loops : uint = 1000000;
		private var m1 : Matrix3d;
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function MatrixAppendBasisTransformTest()
		{
			name = "MatrixAppendBasisTransformTest";
			description = "Comparing appendBasisTransform on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( appendBasisTransformMatrix, null, "appendBasisTransformMatrix", 0, 1, "Matrix3d.appendBasisTransform( v1, v2, v3 )" ), 
			];

			m1 = Utils.randomMatrix();
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

		public function appendBasisTransformMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.appendBasisTransform( v1, v2, v3 );
			}
		}
	}
}
