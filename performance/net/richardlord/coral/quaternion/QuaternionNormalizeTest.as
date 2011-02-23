package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionNormalizeTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionNormalizeTest()
		{
			name = "QuaternionNormalizeTest";
			description = "Comparing normalize on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( normalizeQuaternion, null, "normalizeQuaternion", 0, 1, "Quaternion.normalize" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function normalizeQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.normalize();
			}
		}
	}
}
