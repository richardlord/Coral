package net.richardlord.coral
{
	import org.flexunit.Assert;

	use namespace coral_internal;
	
	public class Point3dUnitTest
	{
		private var x1 : Number;
		private var y1 : Number;
		private var z1 : Number;
		private var w1 : Number;
		private var x2 : Number;
		private var y2 : Number;
		private var z2 : Number;
		private var w2 : Number;

		private function randomNumber() : Number
		{
			return Math.random() * 200 - 100;
		}
		
		private function near( a:Number, b:Number ) : Boolean
		{
			return Math.abs( a - b ) < 0.0000001;
		}

		[Before]
		public function setUp() : void
		{
			x1 = randomNumber();
			y1 = randomNumber();
			z1 = randomNumber();
			w1 = randomNumber();

			x2 = randomNumber();
			y2 = randomNumber();
			z2 = randomNumber();
			w2 = randomNumber();
		}

		[Test]
		public function creation() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			Assert.assertEquals( "Set x correct", x1, p.x );
			Assert.assertEquals( "Set t correct", y1, p.y );
			Assert.assertEquals( "Set z correct", z1, p.z );
			Assert.assertEquals( "Set w correct", 1, p.w );
		}

		[Test]
		public function emptyCreation() : void
		{
			var p : Point3d = new Point3d();
			Assert.assertEquals( "Set default x correct", 0, p.x );
			Assert.assertEquals( "Set default y correct", 0, p.y );
			Assert.assertEquals( "Set default z correct", 0, p.z );
			Assert.assertEquals( "Set default w correct", 1, p.w );
		}

		[Test]
		public function zero() : void
		{
			var p : Point3d = Point3d.ZERO;
			Assert.assertFalse( "Point is copy", p == Point3d.ZERO );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 1, p.w );
		}

		[Test]
		public function reset() : void
		{
			var p : Point3d = new Point3d( x2, y2, z2 );
			p.w = 2;
			p.reset( x1, y1, z1 );
			Assert.assertEquals( "Reset x correct", x1, p.x );
			Assert.assertEquals( "Reset t correct", y1, p.y );
			Assert.assertEquals( "Reset z correct", z1, p.z );
			Assert.assertEquals( "Reset w correct", 1, p.w );
		}

		[Test]
		public function assign() : void
		{
			var p : Point3d = new Point3d( x2, y2, z2 );
			var q : Point3d = new Point3d( x1, y1, z1 );
			q.w = w1;
			p.assign( q );

			Assert.assertEquals( "Assign x correct", x1, p.x );
			Assert.assertEquals( "Assign t correct", y1, p.y );
			Assert.assertEquals( "Assign z correct", z1, p.z );
			Assert.assertEquals( "Assign w correct", w1, p.w );
		}

		[Test]
		public function clone() : void
		{
			var q : Point3d = new Point3d( x1, y1, z1 );
			q.w = w1;
			var p : Point3d = q.clone();

			Assert.assertFalse( "Clone is copy", p == q );
			Assert.assertEquals( "Clone x correct", x1, p.x );
			Assert.assertEquals( "Clone t correct", y1, p.y );
			Assert.assertEquals( "Clone z correct", z1, p.z );
			Assert.assertEquals( "Clone w correct", w1, p.w );
		}

		[Test]
		public function isZero() : void
		{
			var p : Point3d = new Point3d( 0, 0, 0 );
			Assert.assertTrue( "Point isZero is true", p.isZero() );
		}

		[Test]
		public function isNotZero() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			Assert.assertFalse( "Point isZero is false", p.isZero() );
		}

		[Test]
		public function add() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = p.add( v );
			Assert.assertEquals( "Add x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add z correct", z1 + z2, q.z );
			Assert.assertEquals( "Add w correct", 1, q.w );
		}

		[Test]
		public function addInto() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = new Point3d();
			var r : Point3d = p.add( v, q );
			Assert.assertEquals( "Add into x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add into y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add into z correct", z1 + z2, q.z );
			Assert.assertEquals( "Add into w correct", 1, q.w );
			Assert.assertStrictlyEquals( "Add into returns correct", q, r );
		}

		[Test]
		public function subtract() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = p.subtract( v );
			Assert.assertEquals( "Subtract x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract z correct", z1 - z2, q.z );
			Assert.assertEquals( "Subtract w correct", 1, q.w );
		}

		[Test]
		public function subtractInto() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = new Point3d();
			var r : Point3d = p.subtract( v, q );
			Assert.assertEquals( "Subtract into x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract into y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract into z correct", z1 - z2, q.z );
			Assert.assertEquals( "Subtract into w correct", 1, q.w );
			Assert.assertStrictlyEquals( "Subtract into returns correct", q, r );
		}

		[Test]
		public function vectorTo() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x2, y2, z2 );
			var v : Vector3d = p.vectorTo( q );
			Assert.assertEquals( "VectorTo x correct", x2 - x1, v.x );
			Assert.assertEquals( "VectorTo y correct", y2 - y1, v.y );
			Assert.assertEquals( "VectorTo z correct", z2 - z1, v.z );
			Assert.assertEquals( "VectorTo w correct", 0, v.w );
		}

		[Test]
		public function vectorToInto() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x2, y2, z2 );
			var v : Vector3d = new Vector3d();
			var r : Vector3d = p.vectorTo( q, v );
			Assert.assertEquals( "VectorTo into x correct", x2 - x1, v.x );
			Assert.assertEquals( "VectorTo into y correct", y2 - y1, v.y );
			Assert.assertEquals( "VectorTo into z correct", z2 - z1, v.z );
			Assert.assertEquals( "VectorTo into w correct", 0, v.w );
			Assert.assertStrictlyEquals( "VectorTo into returns correct", v, r );
		}
		
		[Test]
		public function incrementBy() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = p.incrementBy( v );
			Assert.assertEquals( "IncrementBy x correct", x1 + x2, p.x );
			Assert.assertEquals( "IncrementBy y correct", y1 + y2, p.y );
			Assert.assertEquals( "IncrementBy z correct", z1 + z2, p.z );
			Assert.assertEquals( "IncrementBy w correct", 1, p.w );
			Assert.assertStrictlyEquals( "IncrementBy returns correct", p, q );
		}

		[Test]
		public function decrementBy() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Point3d = p.decrementBy( v );
			Assert.assertEquals( "DecrementBy x correct", x1 - x2, p.x );
			Assert.assertEquals( "DecrementBy y correct", y1 - y2, p.y );
			Assert.assertEquals( "DecrementBy z correct", z1 - z2, p.z );
			Assert.assertEquals( "DecrementBy w correct", 1, p.w );
			Assert.assertStrictlyEquals( "DecrementBy returns correct", p, q );
		}

		[Test]
		public function equals() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x1, y1, z1 );
			Assert.assertTrue( "Equals is true", p.equals( q ) );
		}
		
		[Test]
		public function notEquals() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x2, y2, z2 );
			Assert.assertFalse( "Equals is false", p.equals( q ) );
		}

		[Test]
		public function nearTo() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x1 + 0.01, y1 + 0.01, z1 + 0.01 );
			Assert.assertTrue( "Equals is true", p.nearTo( q, 0.1 ) );
		}
		
		[Test]
		public function notNearTo() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x1 + 0.09, y1 + 0.09, z1 + 0.09 );
			Assert.assertFalse( "Equals is false", p.nearTo( q, 0.1 ) );
		}

		[Test]
		public function distance() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x2, y2, z2 );
			var d1 : Number = p.distance( q );
			var d2 : Number = Math.sqrt( ( x1 - x2 ) * ( x1 - x2 ) + ( y1 - y2 ) * ( y1 - y2 ) + ( z1 - z2 ) * ( z1 - z2 ) );
			Assert.assertTrue( "Distance correct", near( d2, d1 ) );
		}

		[Test]
		public function distanceSquared() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var q : Point3d = new Point3d( x2, y2, z2 );
			var d1 : Number = p.distanceSquared( q );
			var d2 : Number = ( x1 - x2 ) * ( x1 - x2 ) + ( y1 - y2 ) * ( y1 - y2 ) + ( z1 - z2 ) * ( z1 - z2 );
			Assert.assertEquals( "Distance squared correct", d2, d1 );
		}

		[Test]
		public function project() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			p.w = w1;
			p.project();
			Assert.assertTrue( "Project x correct", near( x1 / w1, p.x ) );
			Assert.assertTrue( "Project y correct", near( y1 / w1, p.y ) );
			Assert.assertTrue( "Project z correct", near( z1 / w1, p.z ) );
			Assert.assertEquals( "Project w correct", w1, p.w );
		}

		[Test]
		public function toVector3d() : void
		{
			var p : Point3d = new Point3d( x1, y1, z1 );
			var v : Vector3d = p.vectorFromOrigin();
			Assert.assertEquals( "ToVector3d x correct", x1, v.x );
			Assert.assertEquals( "ToVector3d y correct", y1, v.y );
			Assert.assertEquals( "ToVector3d z correct", z1, v.z );
			Assert.assertEquals( "ToVector3d w correct", 0, v.w );
		}
	}
}
