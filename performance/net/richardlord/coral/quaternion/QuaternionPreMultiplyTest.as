package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionPreMultiplyTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionPreMultiplyTest()
		{
			name = "QuaternionPreMultiplyTest";
			description = "Comparing preMultiply on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( preMultiplyQuaternion, null, "preMultiplyQuaternion", 0, 1, "Quaternion.preMultiply( q )" ), 
				new MethodTest( preMultiplyQuaternion2, null, "preMultiplyQuaternion2", 0, 1, "Quaternion.preMultiply( q, r )" ), 
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

		public function preMultiplyQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.preMultiply( q2 );
			}
		}

		public function preMultiplyQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.preMultiply( q2, q3 );
			}
		}
	}
}
