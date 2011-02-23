package net.richardlord.coral
{
	import flash.events.Event;
	import net.richardlord.flexunit.AS3TestRunDisplay;
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.FlexUnitCore;

	import flash.display.Sprite;

	[SWF(width='800', height='600', frameRate='30', backgroundColor='#FFFFFF')]
	public class UnitTestRunner extends Sprite
	{
		private var core:FlexUnitCore;
		private var display:AS3TestRunDisplay;
		
		public function UnitTestRunner()
		{
			addEventListener( Event.ENTER_FRAME, start );
		}
		
		private function start( event:Event ) : void
		{
			removeEventListener( Event.ENTER_FRAME, start );
			
			core = new FlexUnitCore();
			
			display = new AS3TestRunDisplay();
			display.width = stage.stageWidth;
			display.height = stage.stageHeight;
			addChild( display );
			
			core.addListener( new TraceListener() );
			core.addListener( display );
			core.run( UnitTestSuite );
		}
	}
}
