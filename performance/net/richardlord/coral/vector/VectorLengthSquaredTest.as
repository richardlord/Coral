package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorLengthSquaredTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;

		public function VectorLengthSquaredTest()
		{
			name = "VectorLengthSquaredTest";
			description = "Comparing construction on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( lengthSquaredVector, null, "lengthSquaredVector", 0, 1, "Vector3d.lengthSquared" ), 
			];

			v1 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function lengthSquaredVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var s : Number = v1.lengthSquared;
			}
		}
	}
}
