package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorAssignTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorAssignTest()
		{
			name = "VectorAssignTest";
			description = "Comparing assign on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( assignVector, null, "assignVector", 0, 1, "Vector3d.assign( v )" ), 
				];

			v1 = new Vector3d();
			v2 = Utils.randomVector();
			v3 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function assignVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.assign( v2 );
				v1.assign( v3 );
			}
		}
	}
}
