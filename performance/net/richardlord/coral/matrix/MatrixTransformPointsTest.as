package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class MatrixTransformPointsTest extends TestSuite
	{
		private var loops : uint = 100000;

		private var m1 : Matrix3d;
		private var v1 : Vector.<Point3d>;
		private var v2 : Vector.<Point3d>;
		private var length : uint = 30;

		public function MatrixTransformPointsTest()
		{
			name = "MatrixTransformPointsTest";
			description = "Comparing transformPoints on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( transformPointsMatrix, null, "transformPointsMatrix", 0, 1, "Matrix3d.transformPoints( v )" ), 
				new MethodTest( transformPointsMatrix2, null, "transformPointsMatrix2", 0, 1, "Matrix3d.transformPoints( v, r )" ), 
				new MethodTest( transformPointsMatrixSelf, null, "transformPointsMatrixSelf", 0, 1, "Matrix3d.transformPointsSelf( v )" ), 
			];

			m1 = Utils.randomMatrix();
			v1 = new Vector.<Point3d>();
			v2 = new Vector.<Point3d>();
			for( var i : uint = 0; i < length; ++i )
			{
				v1.push( Utils.randomPoint() );
				v2.push( new Point3d() );
			}
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function transformPointsMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector.<Point3d> = m1.transformPoints( v1 );
			}
		}

		public function transformPointsMatrix2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformPoints( v1, v2 );
			}
		}

		public function transformPointsMatrixSelf() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m1.transformPointsSelf( v1 );
			}
		}
	}
}
