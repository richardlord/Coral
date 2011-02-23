package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionInvertTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionInvertTest()
		{
			name = "QuaternionInvertTest";
			description = "Comparing invert on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( invertQuaternion, null, "invertQuaternion", 0, 1, "Quaternion.invert" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function invertQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.invert();
			}
		}
	}
}
