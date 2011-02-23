package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorEqualsTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var v3 : Vector3d;

		public function VectorEqualsTest()
		{
			name = "VectorEqualsTest";
			description = "Comparing equals on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( equalsVectorSuccess, null, "equalsVector true", 0, 1, "Vector3d.equals( v ) true" ), 
				new MethodTest( equalsVectorFailure, null, "equalsVector false", 0, 1, "Vector3d.equals( v ) false" ), 
				];

			v1 = Utils.randomVector();
			v2 = v1.clone();
			v3 = Utils.randomVector();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function equalsVectorSuccess() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.equals( v2 );
			}
		}

		public function equalsVectorFailure() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.equals( v3 );
			}
		}
	}
}
