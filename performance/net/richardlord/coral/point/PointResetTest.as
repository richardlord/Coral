package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointResetTest extends TestSuite
	{
		private var loops : uint = 500000;
		
		private var x1 : Number;
		private var y1 : Number;
		private var z1 : Number;
		
		private var x2 : Number;
		private var y2 : Number;
		private var z2 : Number;
		
		private var p1 : Point3d;

		public function PointResetTest()
		{
			name = "VectorResetTest";
			description = "Comparing reset on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( resetPoint, null, "resetPoint", 0, 1, "Point3d.reset( x, y, z )" ), 
				];

			x1 = Utils.randomNumber();
			y1 = Utils.randomNumber();
			z1 = Utils.randomNumber();

			x2 = Utils.randomNumber();
			y2 = Utils.randomNumber();
			z2 = Utils.randomNumber();
			
			p1 = new Point3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function resetPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				p1.reset( x1, y1, z1 );
				p1.reset( x2, y2, z2 );
			}
		}
	}
}
