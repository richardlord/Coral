package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorCloneTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;

		public function VectorCloneTest()
		{
			name = "VectorCloneTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( cloneVectorNative, null, "cloneVectorNative", 0, 1, "Vector3D.clone()" ), 
			];

			n1 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function cloneVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector3D = n1.clone();
			}
		}
	}
}
