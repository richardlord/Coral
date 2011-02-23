package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionSelfConjugateTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionSelfConjugateTest()
		{
			name = "QuaternionConjugateTest";
			description = "Comparing conjugate on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( selfConjugateQuaternion, null, "selfConjugateQuaternion", 0, 1, "Quaternion.selfConjugate()" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function selfConjugateQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.selfConjugate();
			}
		}
	}
}
