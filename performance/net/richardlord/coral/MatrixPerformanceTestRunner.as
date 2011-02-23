package net.richardlord.coral
{
	import net.richardlord.coral.matrix.*;
	import net.richardlord.performance.TableLog;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.text.TextField;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class MatrixPerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function MatrixPerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Matrix3d Performance tests." );
			
			primeJitCompiler();
			queueTests();
		}
		
		private function primeJitCompiler() : void
		{
			var m : Matrix3d = new Matrix3d();
		}

		private function queueTests() : void
		{
			PerformanceTest.queue( new MatrixConstructTest() );
			PerformanceTest.queue( new MatrixCloneTest() );
			PerformanceTest.queue( new MatrixRawDataTest() );
			PerformanceTest.queue( new MatrixAssignTest() );
			PerformanceTest.queue( new MatrixNewScaleTest() );
			PerformanceTest.queue( new MatrixNewTranslationTest() );
			PerformanceTest.queue( new MatrixNewRotationTest() );
			PerformanceTest.queue( new MatrixNewBasisTransformTest() );
			PerformanceTest.queue( new MatrixAppendTest() );
			PerformanceTest.queue( new MatrixAppendScaleTest() );
			PerformanceTest.queue( new MatrixAppendTranslationTest() );
			PerformanceTest.queue( new MatrixAppendRotationTest() );
			PerformanceTest.queue( new MatrixAppendBasisTransformTest() );
			PerformanceTest.queue( new MatrixPrependTest() );
			PerformanceTest.queue( new MatrixPrependScaleTest() );
			PerformanceTest.queue( new MatrixPrependTranslationTest() );
			PerformanceTest.queue( new MatrixPrependRotationTest() );
			PerformanceTest.queue( new MatrixPrependBasisTransformTest() );
			PerformanceTest.queue( new MatrixDeterminantTest() );
			PerformanceTest.queue( new MatrixInvertTest() );
			PerformanceTest.queue( new MatrixInverseTest() );
			PerformanceTest.queue( new MatrixTransformVectorTest() );
			PerformanceTest.queue( new MatrixTransformVectorSelfTest() );
			PerformanceTest.queue( new MatrixTransformPointTest() );
			PerformanceTest.queue( new MatrixTransformPointSelfTest() );
			PerformanceTest.queue( new MatrixTransformVectorsTest() );
			PerformanceTest.queue( new MatrixTransformPointsTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
