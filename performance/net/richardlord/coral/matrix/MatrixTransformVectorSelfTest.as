package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixTransformVectorSelfTest extends TestSuite
	{
		private var loops : uint = 1000000;

		private var m1 : Matrix3d;
		private var v1 : Vector3d;

		public function MatrixTransformVectorSelfTest()
		{
			name = "MatrixTransformVectorSelfTest";
			description = "Comparing transformVectorSelf on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformVectorSelfMatrix, null, "transformVectorSelfMatrix", 0, 1, "Matrix3d.transformVectorSelf( v )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = Utils.randomVector();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformVectorSelfMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformVectorSelf( v1 );
			}
		}
	}
}
