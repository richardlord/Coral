package net.richardlord.coral.vector
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Utils;
	import net.richardlord.coral.Vector3d;

	public class VectorMultiplyTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v1 : Vector3d;
		private var v2 : Vector3d;
		private var s : Number;

		public function VectorMultiplyTest()
		{
			name = "VectorMultiplyTest";
			description = "Comparing multiply on Vectors " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( multiplyVector, null, "multiplyVector", 0, 1, "Vector3d.multiply( s )" ), 
				new MethodTest( multiplyVector2, null, "multiplyVector2", 0, 1, "Vector3d.multiply( s, r )" ), 
				];

			s = Utils.randomNumber();
			v1 = Utils.randomVector();
			v2 = new Vector3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function multiplyVector() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v2 = v1.multiply( s );
			}
		}

		public function multiplyVector2() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				v1.multiply( s, v2 );
			}
		}
	}
}
