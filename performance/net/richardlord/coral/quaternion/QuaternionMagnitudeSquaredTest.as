package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionMagnitudeSquaredTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionMagnitudeSquaredTest()
		{
			name = "QuaternionMagnitudeSquaredTest";
			description = "Comparing magnitudeSquared on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( magnitudeSquaredQuaternion, null, "magnitudeSquaredQuaternion", 0, 1, "Quaternion.magnitudeSquared" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function magnitudeSquaredQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = q1.magnitudeSquared;
			}
		}
	}
}
