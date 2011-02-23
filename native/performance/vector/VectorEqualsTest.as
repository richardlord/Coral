package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;
		private var n3 : Vector3D;

		public function VectorEqualsTest()
		{
			name = "VectorEqualsTest";
			description = "Comparing equals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( equalsVectorNativeSuccess, null, "equalsVectorNative true", 0, 1, "Vector3D.equals( v ) true" ), 
				new MethodTest( equalsVectorNativeFailure, null, "equalsVectorNative false", 0, 1, "Vector3D.equals( v ) false" ), 
				];

			n1 = Utils.randomVector();
			n2 = n1.clone();
			n3 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function equalsVectorNativeSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.equals( n2 );
			}
		}
		
		public function equalsVectorNativeFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1.equals( n3 );
			}
		}
	}
}
