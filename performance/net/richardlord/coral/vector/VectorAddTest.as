package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorAddTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorAddTest()
		{
			name = "VectorAddTest";
			description = "Comparing add on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( addVector, null, "addVector", 0, 1, "Vector3d.add( v )" ), 
				new MethodTest( addVector2, null, "addVector2", 0, 1, "Vector3d.add( v, r )" ), 
				];

			v1 = new Vector3d();
			v2 = Utils.randomVector();
			v3 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function addVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.add( v2 );
			}
		}

		public function addVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.add( v2, v3 );
			}
		}
	}
}
