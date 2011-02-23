package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorIncrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function VectorIncrementTest()
		{
			name = "VectorIncrementTest";
			description = "Comparing incrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( incrementVector, null, "incrementVector", 0, 1, "Vector3d.incrementBy( v )" ), 
				];

			v1 = new Vector3d();
			v2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function incrementVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.incrementBy( v2 );
			}
		}
	}
}
