package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionAddTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionAddTest()
		{
			name = "QuaternionAddTest";
			description = "Comparing add on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( addQuaternion, null, "addQuaternion", 0, 1, "Quaternion.add( q )" ), 
				new MethodTest( addQuaternion2, null, "addQuaternion2", 0, 1, "Quaternion.add( q, r )" ), 
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

		public function addQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.add( q2 );
			}
		}

		public function addQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.add( q2, q3 );
			}
		}
	}
}
