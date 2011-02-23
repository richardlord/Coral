package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointDistanceSquaredTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var p1 : Point3d;
		private var p2 : Point3d;

		public function PointDistanceSquaredTest()
		{
			name = "PointDistanceSquaredTest";
			description = "Comparing distanceSquared on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( distanceSquaredPoint, null, "distanceSquaredPoint", 0, 1, "Point3d.distanceSquared( v )" ), 
				];

			p1 = Utils.randomPoint();
			p2 = Utils.randomPoint();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function distanceSquaredPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = p1.distanceSquared( p2 );
			}
		}
	}
}
