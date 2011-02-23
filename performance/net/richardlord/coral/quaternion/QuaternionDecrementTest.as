package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionDecrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionDecrementTest()
		{
			name = "QuaternionDecrementTest";
			description = "Comparing decrementBy on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( decrementByQuaternion, null, "decrementByQuaternion", 0, 1, "Quaternion.decrementBy( q )" ), 
				];

			q1 = new Quaternion();
			q2 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function decrementByQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.decrementBy( q2 );
			}
		}
	}
}
