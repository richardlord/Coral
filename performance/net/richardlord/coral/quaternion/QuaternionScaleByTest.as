package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionScaleByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var s : Number;
		private var q1 : Quaternion;

		public function QuaternionScaleByTest()
		{
			name = "QuaternionScaleByTest";
			description = "Comparing scaleBy on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( scaleByQuaternion, null, "scaleByQuaternion", 0, 1, "Quaternion.scaleBy( s )" ), 
				];

			s = Utils.randomNumber();
			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function scaleByQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.scaleBy( s );
			}
		}
	}
}
