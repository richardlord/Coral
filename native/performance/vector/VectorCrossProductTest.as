package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorCrossProductTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorCrossProductTest()
		{
			name = "VectorCrossProductTest";
			description = "Comparing crossProduct on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( crossProductVectorNative, null, "crossProductVectorNative", 0, 1, "Vector3D.crossProduct( v )" ), 
				];

			n1 = Utils.randomVector();
			n2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function crossProductVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v:Vector3D = n1.crossProduct( n2 );
			}
		}
	}
}
