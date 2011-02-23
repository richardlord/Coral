package net.richardlord.coral.matrix
{
	import com.gskinner.performance.MethodTest;
	import com.gskinner.performance.TestSuite;
	import net.richardlord.coral.Matrix3d;
	import net.richardlord.coral.Utils;

	public class MatrixRawDataTest extends TestSuite
	{
		private var loops : uint = 1000000;
		
		private var v : Vector.<Number>;
		private var m1 : Matrix3d;
		private var m2 : Matrix3d;

		public function MatrixRawDataTest()
		{
			name = "MatrixRawDataTest";
			description = "Comparing rawData on Matrices " + loops + " loops.";
			tareTest = new MethodTest( tare );
			iterations = 4;
			tests = [ 
				new MethodTest( getRawDataMatrix, null, "getRawDataMatrix", 0, 1, "Matrix3d.rawData" ), 
				new MethodTest( setRawDataMatrix, null, "setRawDataMatrix", 0, 1, "Matrix3d.rawData = v" ), 
			];

			v = Utils.randomVector16();
			m1 = Utils.randomMatrix();
			m2 = new Matrix3d();
		}

		public function tare() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
			}
		}

		public function getRawDataMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				var v : Vector.<Number> = m1.rawData;
			}
		}

		public function setRawDataMatrix() : void
		{
			for (var i : uint = 0; i < loops; i++)
			{
				m2.rawData = v;
			}
		}
	}
}
