package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionNearEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var e : Number = 0.01;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionNearEqualsTest()
		{
			name = "QuaternionNearEqualsTest";
			description = "Comparing nearEquals on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( nearEqualsQuaternionSuccess, null, "nearEqualsQuaternionSuccess", 0, 1, "Quaternion.nearEquals( q )" ), 
				new MethodTest( nearEqualsQuaternionFailure, null, "nearEqualsQuaternionFailure", 0, 1, "Quaternion.nearEquals( q )" ), 
				];

			q1 = Utils.randomQuaternion();
			q2 = Utils.randomQuaternion().normalize().scaleBy( e / 2 ).incrementBy( q1 );
			q3 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function nearEqualsQuaternionSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.nearEquals( q2, e );
			}
		}

		public function nearEqualsQuaternionFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.nearEquals( q3, e );
			}
		}
	}
}
