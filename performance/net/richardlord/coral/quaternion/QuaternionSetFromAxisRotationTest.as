package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionSetFromAxisRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var q1 : Quaternion;
		private var v1 : Vector3d;
		private var u1 : Vector3d;
		private var a : Number;

		public function QuaternionSetFromAxisRotationTest()
		{
			name = "QuaternionSetFromAxisRotationTest";
			description = "Comparing setFromAxisRotation on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( setFromAxisRotationQuaternionUnitVector, null, "setFromAxisRotationQuaternionUnitVector", 0, 1, "Quaternion.setFromAxisRotation( v, a )" ), 
				new MethodTest( setFromAxisRotationQuaternionNonUnitVector, null, "setFromAxisRotationQuaternionNonUnitVector", 0, 1, "Quaternion.setFromAxisRotation( v, a )" ), 
				new MethodTest( setFromAxisRotationQuaternionNoAngle, null, "setFromAxisRotationQuaternionNoAngle", 0, 1, "Quaternion.setFromAxisRotation( v )" ), 
				];

			v1 = Utils.randomVector();
			u1 = v1.unit();
			a = v1.length;
			q1 = new Quaternion();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function setFromAxisRotationQuaternionUnitVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.setFromAxisRotation( u1, a );
			}
		}

		public function setFromAxisRotationQuaternionNonUnitVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.setFromAxisRotation( v1, a );
			}
		}

		public function setFromAxisRotationQuaternionNoAngle() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				q1.setFromAxisRotation( v1 );
			}
		}
	}
}
