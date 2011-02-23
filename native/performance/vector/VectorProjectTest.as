package performance.vector
{
	import performance.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	import flash.geom.Vector3D;

	public class VectorProjectTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var n1 : Vector3D;

		public function VectorProjectTest()
		{
			name = "PointProjectTest";
			description = "Comparing project on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( projectVectorNative, null, "projectVectorNative", 0, 1, "Vector3D.project()" ), 
				];
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1 = Utils.randomVector();
				n1.w = Utils.randomNumber();
			}
		}

		public function projectVectorNative() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				n1 = Utils.randomVector();
				n1.w = Utils.randomNumber();
				n1.project();
			}
		}
	}
}
