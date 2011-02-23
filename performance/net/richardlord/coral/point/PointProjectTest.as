package net.richardlord.coral.point
{
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.coral_internal;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	use namespace coral_internal;

	public class PointProjectTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var p1 : Point3d;

		public function PointProjectTest()
		{
			name = "PointProjectTest";
			description = "Comparing project on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( projectPoint, null, "projectPoint", 0, 1, "Point3d.project()" ), 
				];
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1 = Utils.randomPoint();
				p1.w = Utils.randomNumber();
			}
		}

		public function projectPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1 = Utils.randomPoint();
				p1.w = Utils.randomNumber();
				p1.project();
			}
		}
	}
}
