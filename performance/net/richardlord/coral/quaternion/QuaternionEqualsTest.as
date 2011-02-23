package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionEqualsTest()
		{
			name = "QuaternionEqualsTest";
			description = "Comparing equals on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( equalsQuaternionSuccess, null, "equalsQuaternionSuccess", 0, 1, "Quaternion.equals( q )" ), 
				new MethodTest( equalsQuaternionFailure, null, "equalsQuaternionFailure", 0, 1, "Quaternion.equals( q )" ), 
				];

			q1 = Utils.randomQuaternion();
			q2 = q1.clone();
			q3 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function equalsQuaternionSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.equals( q2 );
			}
		}

		public function equalsQuaternionFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.equals( q3 );
			}
		}
	}
}
