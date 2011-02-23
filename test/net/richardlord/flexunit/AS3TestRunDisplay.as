package net.richardlord.flexunit
{
	import org.flexunit.reporting.FailureFormatter;
	import org.flexunit.runner.IDescription;
	import org.flexunit.runner.Result;
	import org.flexunit.runner.notification.Failure;
	import org.flexunit.runner.notification.IRunListener;

	import flash.display.Sprite;
	import flash.text.TextField;

	/**
	 * @author Richard
	 */
	public class AS3TestRunDisplay extends Sprite implements IRunListener
	{
		private var textDisplay : TextField;

		public function AS3TestRunDisplay()
		{
			textDisplay = new TextField();
			addChild( textDisplay );
		}

		override public function set width( w : Number ) : void
		{
			textDisplay.width = w;
		}

		override public function set height( h : Number ) : void
		{
			textDisplay.height = h;
		}

		public function testRunStarted( description : IDescription ) : void
		{
			textDisplay.appendText( description.displayName + " ." );
		}

		public function testRunFinished( result : Result ) : void
		{
			textDisplay.appendText( "\n" + "Time: " + String( result.runTime / 1000 ) );
			
			var failures:Vector.<Failure> = Vector.<Failure>( result.failures );
			//Determine if there are any failures to print
			if (failures.length == 0)
				return;
			if (failures.length == 1)
				textDisplay.appendText( "\n" + "There was " + failures.length + " failure:" );
			else
				trace("There were " + failures.length + " failures:" );
			
			//Print each failure
			for ( var i:int=0; i<failures.length; i++ ) {
				textDisplay.appendText( "\n" + String( i+1 ) + " " + failures[ i ].testHeader + " " + failures[ i ].stackTrace );
			}

			if (result.successful ) {
				textDisplay.appendText( "\n" + "OK (" + result.runCount + " test " + (result.runCount == 1 ? "" : "s") + ")" );
			} else {
				textDisplay.appendText( "\n" + "FAILURES!!! Tests run: " + result.runCount + ", " + result.failureCount + " Failures:" );
			}
		}

		public function testStarted( description : IDescription ) : void
		{
			textDisplay.appendText( "\n" + description.displayName + " ." );
		}

		public function testFinished( description : IDescription ) : void
		{
		}

		public function testFailure( failure : Failure ) : void
		{
			if ( FailureFormatter.isError( failure.exception ) )
			{
				textDisplay.appendText( "\n" + failure.description.displayName + " Error" );
			}
			else
			{
				textDisplay.appendText( "\n" + failure.description.displayName + " Failure" );
			}
		}

		public function testAssumptionFailure( failure : Failure ) : void
		{
		}

		public function testIgnored( description : IDescription ) : void
		{
			textDisplay.appendText( "\n" + description.displayName + " Ignored" );
		}

		public function testTimed( description : IDescription, runTime : Number ) : void
		{
			textDisplay.appendText( "\n" + description.displayName + " took " + runTime + " ms " );
		}
	}
}
