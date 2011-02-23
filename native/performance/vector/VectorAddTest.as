package performance.vector
{
	import performance.Utils;
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorAddTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;
		private var n2 : Vector3D;

		public function VectorAddTest()
		{
			name = "VectorAddTest";
			description = "Comparing add on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( addVectorNative, null, "addVectorNative", 0, 1, "Vector3D.add( v )" ), 
				];

			n1 = new Vector3D();
			n2 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function addVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.add( n2 );
			}
		}
	}
}
