package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionUnitPerfTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionUnitPerfTest()
		{
			name = "QuaternionUnitTest";
			description = "Comparing unit on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( unitQuaternion, null, "unitQuaternion", 0, 1, "Quaternion.unit()" ), 
				new MethodTest( unitQuaternion2, null, "unitQuaternion2", 0, 1, "Quaternion.unit( r )" ), 
				];

			q1 = Utils.randomQuaternion();
			q2 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function unitQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var r : Quaternion = q1.unit();
			}
		}

		public function unitQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.unit( q2 );
			}
		}
	}
}
