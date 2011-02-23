package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionInverseTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionInverseTest()
		{
			name = "QuaternionInverseTest";
			description = "Comparing inverse on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( inverseQuaternion, null, "inverseQuaternion", 0, 1, "Quaternion.inverse()" ), 
				new MethodTest( inverseQuaternion2, null, "inverseQuaternion2", 0, 1, "Quaternion.inverse( r )" ), 
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

		public function inverseQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var r : Quaternion = q1.inverse();
			}
		}

		public function inverseQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.inverse( q2 );
			}
		}
	}
}
