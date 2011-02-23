package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionAssignTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;
		private var q3 : Quaternion;

		public function QuaternionAssignTest()
		{
			name = "QuaternionAssignTest";
			description = "Test assign on Quaternion " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( assignQuaternion, null, "assignQuaternion", 0, 1, "Quaternion.assign( v )" ), 
				];

			q1 = new Quaternion();
			q2 = Utils.randomQuaternion();
			q3 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function assignQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.assign( q2 );
				q1.assign( q3 );
			}
		}
	}
}
