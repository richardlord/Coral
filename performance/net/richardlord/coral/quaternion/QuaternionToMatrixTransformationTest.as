package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionToMatrixTransformationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionToMatrixTransformationTest()
		{
			name = "QuaternionToMatrixTransformationTest";
			description = "Comparing toMatrixTransformation on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( toMatrixTransformationQuaternion, null, "toMatrixTransformationQuaternion", 0, 1, "Quaternion.toMatrixTransformation()" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function toMatrixTransformationQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var r : Matrix3d = q1.toMatrixTransformation();
			}
		}
	}
}
