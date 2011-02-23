package net.richardlord.coral.point
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Point3d;
	import net.richardlord.coral.Utils;

	public class PointConstructTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var x : Number;
		private var y : Number;
		private var z : Number;

		public function PointConstructTest()
		{
			name = "VectorConstructTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( createPointEmpty, null, "CreatePointEmpty", 0, 1, "new Point3d()" ), 
				new MethodTest( createPoint, null, "CreatePoint", 0, 1, "new Point3d( x, y, z )" ), 
			];

			x = Utils.randomNumber();
			y = Utils.randomNumber();
			z = Utils.randomNumber();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function createPoint() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Point3d = new Point3d( x, y, z );
			}
		}

		public function createPointEmpty() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Point3d = new Point3d();
			}
		}
	}
}
