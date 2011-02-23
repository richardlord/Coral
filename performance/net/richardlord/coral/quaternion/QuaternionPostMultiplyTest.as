package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionPostMultiplyTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionPostMultiplyTest()
		{
			name = "QuaternionPostMultiplyTest";
			description = "Comparing postMultiply on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( postMultiplyQuaternion, null, "postMultiplyQuaternion", 0, 1, "Quaternion.postMultiply( q )" ), 
				new MethodTest( postMultiplyQuaternion2, null, "postMultiplyQuaternion2", 0, 1, "Quaternion.postMultiply( q, r )" ), 
				];

			q1 = Utils.randomQuaternion();
			q2 = Utils.randomQuaternion();
			q3 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function postMultiplyQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.postMultiply( q2 );
			}
		}

		public function postMultiplyQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.postMultiply( q2, q3 );
			}
		}
	}
}
