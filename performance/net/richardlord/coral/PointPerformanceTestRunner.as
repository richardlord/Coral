package net.richardlord.coral
{
	import net.richardlord.coral.point.*;
	import net.richardlord.performance.TableLog;

	import com.gskinner.performance.PerformanceTest;

	import flash.display.Sprite;
	import flash.text.TextField;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class PointPerformanceTestRunner extends Sprite
	{
		private var out : TextField;

		public function PointPerformanceTestRunner()
		{
			out = new TextField();
			out.width = stage.stageWidth;
			out.height = stage.stageHeight;
			addChild( out );

			PerformanceTest.getInstance().delay = 100;
			
			var log : TableLog = new TableLog();
			log.out = logTest;
			log.start( "Point3d Performance tests." );
			
			primeJitCompiler();
			queueTests();
		}

		private function primeJitCompiler() : void
		{
			var p : Point3d = new Point3d();
		}

		private function queueTests() : void
		{
			PerformanceTest.queue( new PointConstructTest() );
			PerformanceTest.queue( new PointResetTest() );
			PerformanceTest.queue( new PointAssignTest() );
			PerformanceTest.queue( new PointCloneTest() );
			PerformanceTest.queue( new PointAddTest() );
			PerformanceTest.queue( new PointSubtractTest() );
			PerformanceTest.queue( new PointIncrementTest() );
			PerformanceTest.queue( new PointDecrementTest() );
			PerformanceTest.queue( new PointEqualsTest() );
			PerformanceTest.queue( new PointNearEqualsTest() );
			PerformanceTest.queue( new PointDistanceTest() );
			PerformanceTest.queue( new PointDistanceSquaredTest() );
			PerformanceTest.queue( new PointProjectTest() );
		}

		private function logTest( str : * ) : void
		{
			out.appendText( String( str ) + "\n" );
			out.scrollV = out.maxScrollV;
		}
	}
}
