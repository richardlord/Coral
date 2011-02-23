package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class PointAddTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v2 : Vector3d;
		private var p1 : Point3d;
		private var p2 : Point3d;

		public function PointAddTest()
		{
			name = "VectorAddTest";
			description = "Comparing add on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( addPoint, null, "addPoint", 0, 1, "Point3d.add( v )" ), 
				new MethodTest( addPoint2, null, "addPoint2", 0, 1, "Point3d.add( v, r )" ), 
				];

			v2 = Utils.randomVector();
			p1 = new Point3d();
			p2 = new Point3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function addPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.add( v2 );
			}
		}

		public function addPoint2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.add( v2, p2 );
			}
		}
	}
}
