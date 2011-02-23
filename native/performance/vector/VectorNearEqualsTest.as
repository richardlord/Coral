package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorNearEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var e : Number = 0.01;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;
		private var n3 : Vector3D;

		public function VectorNearEqualsTest()
		{
			name = "VectorNearEqualsTest";
			description = "Comparing nearEquals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( nearEqualsVectorNativeSuccess, null, "nearEqualsVectorNative true", 0, 1, "Vector3D.nearEquals( v ) true" ), 
				new MethodTest( nearEqualsVectorNativeFailure, null, "nearEqualsVectorNative false", 0, 1, "Vector3D.nearEquals( v ) false" ), 
				];

			n1 = Utils.randomVector();
			n2 = Utils.randomVector();
			n2.normalize();
			n2.scaleBy( e / 2 );
			n2.incrementBy( n1 );
			n3 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function nearEqualsVectorNativeSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.nearEquals( n2, e );
			}
		}
		
		public function nearEqualsVectorNativeFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.nearEquals( n3, e );
			}
		}
	}
}
