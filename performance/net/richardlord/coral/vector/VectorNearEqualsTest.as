package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorNearEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var e : Number = 0.01;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorNearEqualsTest()
		{
			name = "VectorNearEqualsTest";
			description = "Comparing nearEquals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( nearEqualsVectorSuccess, null, "nearEqualsVector true", 0, 1, "Vector3d.nearEquals( v ) true" ), 
				new MethodTest( nearEqualsVectorFailure, null, "nearEqualsVector false", 0, 1, "Vector3d.nearEquals( v ) false" ), 
				];

			v1 = Utils.randomVector();
			v2 = Utils.randomVector().normalize().scaleBy( e / 2 ).incrementBy( v1 );
			v3 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function nearEqualsVectorSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.nearEquals( v2, e );
			}
		}

		public function nearEqualsVectorFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.nearEquals( v3, e );
			}
		}
	}
}
