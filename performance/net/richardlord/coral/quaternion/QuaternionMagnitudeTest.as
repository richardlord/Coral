package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionMagnitudeTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionMagnitudeTest()
		{
			name = "QuaternionMagnitudeTest";
			description = "Comparing magnitude on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( magnitudeQuaternion, null, "magnitudeQuaternion", 0, 1, "Quaternion.magnitude" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function magnitudeQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = q1.magnitude;
			}
		}
	}
}
