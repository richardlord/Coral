package net.richardlord.coral.quaternion
{
	import net.richardlord.coral.Quaternion;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;

	public class QuaternionNewFromAxisRotationTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var u1 : Vector3d;
		private var a : Number;

		public function QuaternionNewFromAxisRotationTest()
		{
			name = "QuaternionNewFromAxisRotationTest";
			description = "Comparing newFromAxisRotation on Quaternions " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( newFromAxisRotationQuaternionUnitVector, null, "newFromAxisRotationQuaternionUnitVector", 0, 1, "Quaternion.newFromAxisRotation( v, a )" ), 
				new MethodTest( newFromAxisRotationQuaternionNonUnitVector, null, "newFromAxisRotationQuaternionNonUnitVector", 0, 1, "Quaternion.newFromAxisRotation( v, a )" ), 
				new MethodTest( newFromAxisRotationQuaternionNoAngle, null, "newFromAxisRotationQuaternionNoAngle", 0, 1, "Quaternion.newFromAxisRotation( v )" ), 
				];

			v1 = Utils.randomVector();
			u1 = v1.unit();
			a = v1.length;
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function newFromAxisRotationQuaternionUnitVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q:Quaternion = Quaternion.newFromAxisRotation( u1, a );
			}
		}

		public function newFromAxisRotationQuaternionNonUnitVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q:Quaternion = Quaternion.newFromAxisRotation( v1, a );
			}
		}

		public function newFromAxisRotationQuaternionNoAngle() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var q:Quaternion = Quaternion.newFromAxisRotation( v1 );
			}
		}
	}
}
