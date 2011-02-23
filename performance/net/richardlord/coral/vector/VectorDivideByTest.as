package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorDivideByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var s : Number;

		public function VectorDivideByTest()
		{
			name = "VectorDivideByTest";
			description = "Comparing divideBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( divideByVector, null, "divideByVector", 0, 1, "Vector3d.divideBy( s )" ), 
				];

			s = Utils.randomNumber();
			v1 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function divideByVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.divideBy( s );
			}
		}
	}
}
