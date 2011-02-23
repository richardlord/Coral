package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionSubtractTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionSubtractTest()
		{
			name = "QuaternionSubtractTest";
			description = "Comparing subtract on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( subtractQuaternion, null, "subtractQuaternion", 0, 1, "Quaternion.subtract( q )" ), 
				new MethodTest( subtractQuaternion2, null, "subtractQuaternion2", 0, 1, "Quaternion.subtract( q, r )" ), 
				];

			q1 = new Quaternion();
			q2 = Utils.randomQuaternion();
			q3 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function subtractQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.subtract( q2 );
			}
		}

		public function subtractQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.subtract( q2, q3 );
			}
		}
	}
}
