package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorResetTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var x1 : Number;
		private var y1 : Number;
		private var z1 : Number;
		
		private var x2 : Number;
		private var y2 : Number;
		private var z2 : Number;
		
		private var v1 : Vector3d;

		public function VectorResetTest()
		{
			name = "VectorResetTest";
			description = "Comparing reset on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( resetVector, null, "resetVector", 0, 1, "Vector3d.reset( x, y, z )" ), 
				];

			x1 = Utils.randomNumber();
			y1 = Utils.randomNumber();
			z1 = Utils.randomNumber();

			x2 = Utils.randomNumber();
			y2 = Utils.randomNumber();
			z2 = Utils.randomNumber();

			v1 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function resetVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.reset( x1, y1, z1 );
				v1.reset( x2, y2, z2 );
			}
		}
	}
}
