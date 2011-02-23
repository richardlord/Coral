package performance
{
	import net.richardlord.performance.TableLog;

	import performance.vector.*;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.geom.Vector3D;
	import flash.text.TextField;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class NativeVectorPerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function NativeVectorPerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Native Vector3D Performance tests." );
			
			primeJitCompiler();
			queueTests();
		}

		private function primeJitCompiler() : void
		{
			var v : Vector3D = new Vector3D();
		}

		private function queueTests() : void
		{
			PerformanceTest.queue( new VectorConstructTest() );
			PerformanceTest.queue( new VectorCloneTest() );
			PerformanceTest.queue( new VectorAddTest() );
			PerformanceTest.queue( new VectorSubtractTest() );
			PerformanceTest.queue( new VectorMultiplyTest() );
			PerformanceTest.queue( new VectorDivideTest() );
			PerformanceTest.queue( new VectorIncrementTest() );
			PerformanceTest.queue( new VectorDecrementTest() );
			PerformanceTest.queue( new VectorScaleByTest() );
			PerformanceTest.queue( new VectorDivideByTest() );
			PerformanceTest.queue( new VectorEqualsTest() );
			PerformanceTest.queue( new VectorNearEqualsTest() );
			PerformanceTest.queue( new VectorDotProductTest() );
			PerformanceTest.queue( new VectorCrossProductTest() );
			PerformanceTest.queue( new VectorLengthTest() );
			PerformanceTest.queue( new VectorLengthSquaredTest() );
			PerformanceTest.queue( new VectorDistanceTest() );
			PerformanceTest.queue( new VectorDistanceSquaredTest() );
			PerformanceTest.queue( new VectorNegativeTest() );
			PerformanceTest.queue( new VectorNegateTest() );
			PerformanceTest.queue( new VectorNormalizeTest() );
			PerformanceTest.queue( new VectorUnitTest() );
			PerformanceTest.queue( new VectorProjectTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
