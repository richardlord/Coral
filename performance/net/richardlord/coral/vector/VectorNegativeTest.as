package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorNegativeTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function VectorNegativeTest()
		{
			name = "VectorNegativeTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( negativeVector, null, "negativeVector", 0, 1, "Vector3d.negative()" ), 
				new MethodTest( negativeVector2, null, "negativeVector2", 0, 1, "Vector3d.negative( r )" ), 
			];

			v1 = Utils.randomVector();
			v2 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function negativeVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3d = v1.negative();
			}
		}

		public function negativeVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.negative( v2 );
			}
		}
	}
}
