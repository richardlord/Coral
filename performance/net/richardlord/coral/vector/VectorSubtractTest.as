package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorSubtractTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorSubtractTest()
		{
			name = "VectorSubtractTest";
			description = "Comparing subtract on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( subtractVector, null, "subtractVector", 0, 1, "Vector3d.subtract( v )" ), 
				new MethodTest( subtractVector2, null, "subtractVector2", 0, 1, "Vector3d.subtract( v, r )" ), 
				];

			v1 = new Vector3d( 100000, 100000, 100000 );
			v2 = Utils.randomVector();
			v3 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}
		
		public function subtractVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.subtract( v2 );
			}
		}

		public function subtractVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.subtract( v2, v3 );
			}
		}
	}
}
