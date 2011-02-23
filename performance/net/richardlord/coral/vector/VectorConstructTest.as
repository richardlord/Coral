package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function VectorConstructTest()
		{
			name = "VectorConstructTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createVectorEmpty, null, "CreateVectorEmpty", 0, 1, "new Vector3d()" ), 
				new MethodTest( createVector, null, "CreateVector", 0, 1, "new Vector3d( x, y, z )" ), 
			];

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

		public function createVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3d = new Vector3d( x, y, z );
			}
		}

		public function createVectorEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3d = new Vector3d();
			}
		}
	}
}
