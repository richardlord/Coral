package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorDecrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function VectorDecrementTest()
		{
			name = "VectorDecrementTest";
			description = "Comparing decrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( decrementVector, null, "decrementVector", 0, 1, "Vector3d.decrementBy( v )" ), 
				];

			v1 = new Vector3d( 100000, 100000, 100000 );
			v2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function decrementVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.decrementBy( v2 );
			}
		}
	}
}
