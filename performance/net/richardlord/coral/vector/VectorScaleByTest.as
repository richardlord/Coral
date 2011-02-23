package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorScaleByTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var s : Number;
		private var v1 : Vector3d;

		public function VectorScaleByTest()
		{
			name = "VectorScaleByTest";
			description = "Comparing scaleByBy on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( scaleByVector, null, "scaleByVector", 0, 1, "Vector3d.scaleBy( s )" ), 
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

		public function scaleByVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.scaleBy( s );
			}
		}
	}
}
