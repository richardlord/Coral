package performance
{
	import performance.matrix.*;

	import net.richardlord.performance.TableLog;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.geom.Matrix3D;
	import flash.text.TextField;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class NativeMatrixPerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function NativeMatrixPerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Native Matrix3D Performance tests." );
			
			primeJitCompiler();
			queueTests();
		}
		
		private function primeJitCompiler() : void
		{
			var m : Matrix3D = new Matrix3D();
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
			PerformanceTest.queue( new MatrixAppendTest() );
			PerformanceTest.queue( new MatrixAppendScaleTest() );
			PerformanceTest.queue( new MatrixAppendTranslationTest() );
			PerformanceTest.queue( new MatrixAppendRotationTest() );
			PerformanceTest.queue( new MatrixPrependTest() );
			PerformanceTest.queue( new MatrixPrependScaleTest() );
			PerformanceTest.queue( new MatrixPrependTranslationTest() );
			PerformanceTest.queue( new MatrixPrependRotationTest() );
			PerformanceTest.queue( new MatrixDeterminantTest() );
			PerformanceTest.queue( new MatrixInvertTest() );
			PerformanceTest.queue( new MatrixInverseTest() );
			PerformanceTest.queue( new MatrixTransformVectorTest() );
			PerformanceTest.queue( new MatrixTransformPointTest() );
			PerformanceTest.queue( new MatrixTransformPointsTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
