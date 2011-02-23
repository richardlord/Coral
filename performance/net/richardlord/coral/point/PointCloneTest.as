package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointCloneTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var p1 : Point3d;

		public function PointCloneTest()
		{
			name = "VectorCloneTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( clonePoint, null, "clonePoint", 0, 1, "Point3d.clone()" ), 
			];

			p1 = Utils.randomPoint();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function clonePoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Point3d = p1.clone();
			}
		}
	}
}
