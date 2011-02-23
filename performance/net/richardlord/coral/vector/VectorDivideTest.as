package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorDivideTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var s : Number;

		public function VectorDivideTest()
		{
			name = "VectorDivideTest";
			description = "Comparing divide on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( divideVector, null, "divideVector", 0, 1, "Vector3d.divide( s )" ), 
				new MethodTest( divideVector2, null, "divideVector2", 0, 1, "Vector3d.divide( s, r )" ), 
				];

			s = Utils.randomNumber();
			v1 = Utils.randomVector();
			v2 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function divideVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v2 = v1.divide( s );
			}
		}

		public function divideVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.divide( s, v2 );
			}
		}
	}
}
