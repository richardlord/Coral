package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class MatrixTransformVectorsTest extends TestSuite
	{
		private var loops : uint = 100000;

		private var m1 : Matrix3d;
		private var v1 : Vector.<Vector3d>;
		private var v2 : Vector.<Vector3d>;
		private var length : uint = 30;

		public function MatrixTransformVectorsTest()
		{
			name = "MatrixTransformVectorsTest";
			description = "Comparing transformVectors on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformVectorsMatrix, null, "transformVectorsMatrix", 0, 1, "Matrix3d.transformVectors( v )" ), 
				new MethodTest( transformVectorsMatrix2, null, "transformVectorsMatrix2", 0, 1, "Matrix3d.transformVectors( v, r )" ), 
				new MethodTest( transformVectorsMatrixSelf, null, "transformVectorsMatrixSelf", 0, 1, "Matrix3d.transformVectorsSelf( v )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = new Vector.<Vector3d>;
			v2 = new Vector.<Vector3d>();
			for( var i : uint = 0; i < length; ++i )
			{
				v1.push( Utils.randomVector() );
				v2.push( new Vector3d() );
			}
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformVectorsMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector.<Vector3d> = m1.transformVectors( v1 );
			}
		}

		public function transformVectorsMatrix2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformVectors( v1, v2 );
			}
		}

		public function transformVectorsMatrixSelf() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformVectorsSelf( v1 );
			}
		}
	}
}
