package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionScalarMultiplyTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var s : Number;
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionScalarMultiplyTest()
		{
			name = "QuaternionScalarMultiplyTest";
			description = "Comparing scalarMultiply on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( scalarMultiplyQuaternion, null, "scalarMultiplyQuaternion", 0, 1, "Quaternion.scalarMultiply( s )" ), 
				new MethodTest( scalarMultiplyQuaternion2, null, "scalarMultiplyQuaternion2", 0, 1, "Quaternion.scalarMultiply( s, r )" ), 
				];

			s = Utils.randomNumber();
			q1 = Utils.randomQuaternion();
			q2 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function scalarMultiplyQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.scalarMultiply( s );
			}
		}

		public function scalarMultiplyQuaternion2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.scalarMultiply( s, q2 );
			}
		}
	}
}
