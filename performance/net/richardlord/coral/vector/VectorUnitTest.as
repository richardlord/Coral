package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorUnitTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function VectorUnitTest()
		{
			name = "VectorUnitTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( unitVector, null, "unitVector", 0, 1, "Vector3d.unit()" ), 
				new MethodTest( unitVector2, null, "unitVector2", 0, 1, "Vector3d.unit( r )" ), 
			];

			v2 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1 = Utils.randomVector();
			}
		}

		public function unitVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1 = Utils.randomVector();
				var v : Vector3d = v1.unit();
			}
		}

		public function unitVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1 = Utils.randomVector();
				v1.unit( v2 );
			}
		}
	}
}
