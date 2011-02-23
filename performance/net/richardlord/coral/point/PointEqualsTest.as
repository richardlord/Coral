package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var p1 : Point3d;
		private var p2 : Point3d;
		private var p3 : Point3d;

		public function PointEqualsTest()
		{
			name = "VectorEqualsTest";
			description = "Comparing equals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( equalsPointSuccess, null, "equalsPoint true", 0, 1, "Point3d.equals( v ) true" ), 
				new MethodTest( equalsPointFailure, null, "equalsPoint false", 0, 1, "Point3d.equals( v ) false" ), 
				];

			p1 = Utils.randomPoint();
			p2 = p1.clone();
			p3 = Utils.randomPoint();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function equalsPointSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.equals( p2 );
			}
		}

		public function equalsPointFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.equals( p3 );
			}
		}
	}
}
