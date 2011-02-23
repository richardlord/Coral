package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionToAxisRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;

		public function QuaternionToAxisRotationTest()
		{
			name = "QuaternionToAxisRotationTest";
			description = "Comparing toAxisRotation on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( toAxisRotationQuaternion, null, "toAxisRotationQuaternion", 0, 1, "Quaternion.toAxisRotation()" ), 
				];

			q1 = Utils.randomQuaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function toAxisRotationQuaternion() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var r : Vector3d = q1.toAxisRotation();
			}
		}
	}
}
