package net.richardlord.coral.quaternion
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Quaternion;

	public class QuaternionResetTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var w1 : Number;
		private var x1 : Number;
		private var y1 : Number;
		private var z1 : Number;
		
		private var w2 : Number;
		private var x2 : Number;
		private var y2 : Number;
		private var z2 : Number;
		
		private var q1 : Quaternion;

		public function QuaternionResetTest()
		{
			name = "QuaternionResetTest";
			description = "Test reset on Quaternion " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( resetQuaternion, null, "resetQuaternion", 0, 1, "Quaternion.reset( x, y, z )" ), 
				];

			w1 = Utils.randomNumber();
			x1 = Utils.randomNumber();
			y1 = Utils.randomNumber();
			z1 = Utils.randomNumber();

			w2 = Utils.randomNumber();
			x2 = Utils.randomNumber();
			y2 = Utils.randomNumber();
			z2 = Utils.randomNumber();

			q1 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function resetQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.reset( w1, x1, y1, z1 );
				q1.reset( w2, x2, y2, z2 );
			}
		}
	}
}
