package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class PointSubtractTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v2 : Vector3d;
		private var p1 : Point3d;
		private var p2 : Point3d;

		public function PointSubtractTest()
		{
			name = "VectorSubtractTest";
			description = "Comparing subtract on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( subtractPoint, null, "subtractPoint", 0, 1, "Point3d.subtract( v )" ), 
				new MethodTest( subtractPoint2, null, "subtractPoint2", 0, 1, "Point3d.subtract( v, r )" ), 
				];
				
			v2 = Utils.randomVector();
			p1 = new Point3d( 100000, 100000, 100000 );
			p2 = new Point3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function subtractPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.subtract( v2 );
			}
		}

		public function subtractPoint2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.subtract( v2, p2 );
			}
		}
	}
}
