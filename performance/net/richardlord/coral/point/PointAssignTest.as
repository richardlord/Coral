package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointAssignTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var p1 : Point3d;
		private var p2 : Point3d;
		private var p3 : Point3d;

		public function PointAssignTest()
		{
			name = "VectorAssignTest";
			description = "Comparing assign on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( assignPoint, null, "assignPoint", 0, 1, "Point3d.assign( v )" ), 
				];

			p1 = new Point3d();
			p2 = Utils.randomPoint();
			p3 = Utils.randomPoint();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function assignPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.assign( p2 );
				p1.assign( p3 );
			}
		}
	}
}
