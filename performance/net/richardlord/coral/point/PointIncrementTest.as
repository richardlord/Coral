package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class PointIncrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v2 : Vector3d;
		private var p1 : Point3d;

		public function PointIncrementTest()
		{
			name = "VectorIncrementTest";
			description = "Comparing incrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( incrementPoint, null, "incrementPoint", 0, 1, "Point3d.incrementBy( v )" ), 
				];

			v2 = Utils.randomVector();
			p1 = new Point3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function incrementPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.incrementBy( v2 );
			}
		}
	}
}
