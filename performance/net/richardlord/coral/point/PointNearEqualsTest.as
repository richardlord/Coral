package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointNearEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var e: Number = 0.01;
		
		private var p1 : Point3d;
		private var p2 : Point3d;
		private var p3 : Point3d;

		public function PointNearEqualsTest()
		{
			name = "VectorNearEqualsTest";
			description = "Comparing nearEquals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( nearToPointSuccess, null, "nearToPoint true", 0, 1, "Point3d.nearTo( p ) true" ), 
				new MethodTest( nearToPointFailure, null, "nearToPoint false", 0, 1, "Point3d.nearTo( p ) false" ), 
				];

			p1 = Utils.randomPoint();
			p2 = p1.add( Utils.randomVector().normalize().scaleBy( e / 2 ) );
			p3 = Utils.randomPoint();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function nearToPointSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.nearTo( p2, e );
			}
		}

		public function nearToPointFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.nearTo( p3, e );
			}
		}
	}
}
