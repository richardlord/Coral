package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionConjugateTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionConjugateTest()
		{
			name = "QuaternionMakeConjugateTest";
			description = "Comparing conjugate on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( conjugateQuaternion, null, "conjugateQuaternion", 0, 1, "Quaternion.conjugate()" ), 
				new MethodTest( conjugateQuaternion2, null, "conjugateQuaternion2", 0, 1, "Quaternion.conjugate( r )" ), 
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

		public function conjugateQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q : Quaternion = q1.conjugate();
			}
		}

		public function conjugateQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.conjugate( q2 );
			}
		}
	}
}
