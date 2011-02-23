package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorDotProductTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;

		public function VectorDotProductTest()
		{
			name = "VectorDotProductTest";
			description = "Comparing dotProduct on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( dotProductVector, null, "dotProductVector", 0, 1, "Vector3d.dotProduct( v )" ), 
				];

			v1 = Utils.randomVector();
			v2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function dotProductVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s:Number = v1.dotProduct( v2 );
			}
		}
	}
}
