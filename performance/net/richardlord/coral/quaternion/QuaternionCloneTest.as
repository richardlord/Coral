package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionCloneTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionCloneTest()
		{
			name = "QuaternionCloneTest";
			description = "Test clone on Quaternion " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( cloneQuaternion, null, "cloneQuaternion", 0, 1, "Quaternion.clone()" ), 
			];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function cloneQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q : Quaternion = q1.clone();
			}
		}
	}
}
