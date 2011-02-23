package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionPreMultiplyByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var q2 : Quaternion;

		public function QuaternionPreMultiplyByTest()
		{
			name = "QuaternionPreMultiplyByTest";
			description = "Comparing preMultiplyBy on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( preMultiplyByQuaternion, null, "preMultiplyByQuaternion", 0, 1, "Quaternion.preMultiplyBy( q )" ), 
				];

			q1 = Utils.randomQuaternion();
			q2 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function preMultiplyByQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.preMultiplyBy( q2 );
			}
		}
	}
}
