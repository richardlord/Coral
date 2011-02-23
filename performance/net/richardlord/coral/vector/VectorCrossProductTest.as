package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorCrossProductTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorCrossProductTest()
		{
			name = "VectorCrossProductTest";
			description = "Comparing crossProduct on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( crossProductVector, null, "crossProductVector", 0, 1, "Vector3d.crossProduct( v )" ), 
				new MethodTest( crossProductVector2, null, "crossProductVector2", 0, 1, "Vector3d.crossProduct( v, r )" ), 
				];

			v1 = Utils.randomVector();
			v2 = Utils.randomVector();
			v3 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function crossProductVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s:Vector3d = v1.crossProduct( v2 );
			}
		}

		public function crossProductVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.crossProduct( v2, v3 );
			}
		}
	}
}
