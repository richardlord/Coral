package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class PointDecrementTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v2 : Vector3d;
		private var p1 : Point3d;

		public function PointDecrementTest()
		{
			name = "VectorDecrementTest";
			description = "Comparing decrementBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( decrementPoint, null, "decrementPoint", 0, 1, "Point3d.decrementBy( v )" ), 
				];

			v2 = Utils.randomVector();
			p1 = new Point3d( 100000, 100000, 100000 );
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function decrementPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.decrementBy( v2 );
			}
		}
	}
}
