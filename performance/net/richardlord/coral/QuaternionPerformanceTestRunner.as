package net.richardlord.coral
{
	import net.richardlord.coral.quaternion.*;
	import net.richardlord.performance.TableLog;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.text.TextField;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class QuaternionPerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function QuaternionPerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Quaternion Performance tests." );
			
			primeJitCompiler();
			queueTests();
		}
		
		private function primeJitCompiler() : void
		{
			var q : Quaternion = new Quaternion();
		}

		private function queueTests() : void
		{
			PerformanceTest.queue( new QuaternionConstructTest() );
			PerformanceTest.queue( new QuaternionResetTest() );
			PerformanceTest.queue( new QuaternionAssignTest() );
			PerformanceTest.queue( new QuaternionCloneTest() );
			PerformanceTest.queue( new QuaternionAddTest() );
			PerformanceTest.queue( new QuaternionSubtractTest() );
			PerformanceTest.queue( new QuaternionScalarMultiplyTest() );
			PerformanceTest.queue( new QuaternionPreMultiplyTest() );
			PerformanceTest.queue( new QuaternionPostMultiplyTest() );
			PerformanceTest.queue( new QuaternionIncrementTest() );
			PerformanceTest.queue( new QuaternionDecrementTest() );
			PerformanceTest.queue( new QuaternionScaleByTest() );
			PerformanceTest.queue( new QuaternionPreMultiplyByTest() );
			PerformanceTest.queue( new QuaternionPostMultiplyByTest() );
			PerformanceTest.queue( new QuaternionEqualsTest() );
			PerformanceTest.queue( new QuaternionNearEqualsTest() );
			PerformanceTest.queue( new QuaternionMagnitudeTest() );
			PerformanceTest.queue( new QuaternionMagnitudeSquaredTest() );
			PerformanceTest.queue( new QuaternionDotProductTest() );
			PerformanceTest.queue( new QuaternionConjugateTest() );
			PerformanceTest.queue( new QuaternionSelfConjugateTest() );
			PerformanceTest.queue( new QuaternionInverseTest() );
			PerformanceTest.queue( new QuaternionInvertTest() );
			PerformanceTest.queue( new QuaternionUnitPerfTest() );
			PerformanceTest.queue( new QuaternionNormalizeTest() );
			PerformanceTest.queue( new QuaternionSetFromAxisRotationTest() );
			PerformanceTest.queue( new QuaternionNewFromAxisRotationTest() );
			PerformanceTest.queue( new QuaternionToAxisRotationTest() );
			PerformanceTest.queue( new QuaternionToMatrixTransformationTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
