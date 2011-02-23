package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorNormalizeTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;

		public function VectorNormalizeTest()
		{
			name = "VectorNormalizeTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( normalizeVector, null, "normalizeVector", 0, 1, "Vector3d.normalize()" ), 
			];
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1 = Utils.randomVector();
			}
		}

		public function normalizeVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1 = Utils.randomVector();
				v1.normalize();
			}
		}
	}
}
