package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var w : Number;
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function QuaternionConstructTest()
		{
			name = "QuaternionConstructTest";
			description = "Test construction on Quaternion " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createQuaternionEmpty, null, "CreateQuaternionEmpty", 0, 1, "new Quaternion()" ), 
				new MethodTest( createQuaternion, null, "CreateQuaternion", 0, 1, "new Quaternion( w, x, y, z )" ), 
			];

			w = Utils.randomNumber();
			x = Utils.randomNumber();
			y = Utils.randomNumber();
			z = Utils.randomNumber();
		}
		
		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function createQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q : Quaternion = new Quaternion( w, x, y, z );
			}
		}

		public function createQuaternionEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q : Quaternion = new Quaternion();
			}
		}
	}
}
