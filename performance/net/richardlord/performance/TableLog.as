package net.richardlord.performance
{
	import com.gskinner.performance.PerformanceTest;

	import flash.events.Event;
	import flash.system.Capabilities;

	public class TableLog
	{
		public var out : Function = trace;
		
		public var text : String;
		protected var performanceTest : PerformanceTest;

		public function TableLog( performanceTest : PerformanceTest = null )
		{
			this.performanceTest = performanceTest ? performanceTest : PerformanceTest.getInstance();
		}
		
		public function start( title : String = "" ) : void
		{
			performanceTest.addEventListener( Event.COMPLETE, handleComplete );
			performanceTest.addEventListener( Event.CLOSE, handleAllComplete );
			text = "";
			
			log( "<table>" );
			if( title )
			{
				log( "<tr><td colspan=\"2\">" + title + "</td></tr>" );
			}
			log( "<tr><td colspan=\"2\">Running tests on " + Capabilities.version + " " + ( Capabilities.isDebugger ? "DEBUG" : "RELEASE" ) + "</td></tr>" );
			log( "<tr><td>Description</td><td>Time (ms)</td></tr>" );
		}

		protected function log( str : String ) : void
		{
			if (text.length > 0)
			{
				text += "\n";
			}
			text += str;
			out( str );
		}

		protected function handleComplete( evt : Event ) : void
		{
			log( "<tr><td>" + performanceTest.currentTest.description + "</td><td>" + ( performanceTest.currentTest.time - performanceTest.currentTestSuite.tareTime ) + "</td></tr>" );
		}

		protected function handleAllComplete( evt : Event ) : void
		{
			log( "</table>" );
		}
	}
}
