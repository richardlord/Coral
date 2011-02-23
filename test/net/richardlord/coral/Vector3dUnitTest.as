package net.richardlord.coral
{
	import org.flexunit.Assert;

	use namespace coral_internal;
	
	public class Vector3dUnitTest
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
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			Assert.assertEquals( "Set x correct", x1, p.x );
			Assert.assertEquals( "Set t correct", y1, p.y );
			Assert.assertEquals( "Set z correct", z1, p.z );
			Assert.assertEquals( "Set w correct", 0, p.w );
		}

		[Test]
		public function emptyCreation() : void
		{
			var p : Vector3d = new Vector3d();
			Assert.assertEquals( "Set default x correct", 0, p.x );
			Assert.assertEquals( "Set default y correct", 0, p.y );
			Assert.assertEquals( "Set default z correct", 0, p.z );
			Assert.assertEquals( "Set default w correct", 0, p.w );
		}

		[Test]
		public function zero() : void
		{
			var p : Vector3d = Vector3d.ZERO;
			Assert.assertFalse( "Vector is copy", p == Vector3d.ZERO );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test]
		public function xAxis() : void
		{
			var p : Vector3d = Vector3d.X_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3d.X_AXIS );
			Assert.assertEquals( "Zero x correct", 1, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test]
		public function yAxis() : void
		{
			var p : Vector3d = Vector3d.Y_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3d.Y_AXIS );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 1, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test]
		public function zAxis() : void
		{
			var p : Vector3d = Vector3d.Z_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3d.Z_AXIS );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 1, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test]
		public function reset() : void
		{
			var p : Vector3d = new Vector3d( x2, y2, z2 );
			p.w = w2;
			p.reset( x1, y1, z1 );
			Assert.assertEquals( "Reset x correct", x1, p.x );
			Assert.assertEquals( "Reset t correct", y1, p.y );
			Assert.assertEquals( "Reset z correct", z1, p.z );
			Assert.assertEquals( "Reset w correct", 0, p.w );
		}

		[Test]
		public function assign() : void
		{
			var p : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = new Vector3d( x1, y1, z1 );
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
			var q : Vector3d = new Vector3d( x1, y1, z1 );
			q.w = w1;
			var p : Vector3d = q.clone();

			Assert.assertFalse( "Clone is copy", p == q );
			Assert.assertEquals( "Clone x correct", x1, p.x );
			Assert.assertEquals( "Clone t correct", y1, p.y );
			Assert.assertEquals( "Clone z correct", z1, p.z );
			Assert.assertEquals( "Clone w correct", w1, p.w );
		}

		[Test]
		public function isZero() : void
		{
			var p : Vector3d = new Vector3d( 0, 0, 0 );
			Assert.assertTrue( "Vector isZero is true", p.isZero() );
		}

		[Test]
		public function isNotZero() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			Assert.assertFalse( "Vector isZero is false", p.isZero() );
		}

		[Test]
		public function add() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = p.add( v );
			Assert.assertEquals( "Add x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add z correct", z1 + z2, q.z );
			Assert.assertEquals( "Add w correct", 0, q.w );
		}

		[Test]
		public function addInto() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = new Vector3d();
			var r : Vector3d = p.add( v, q );
			Assert.assertEquals( "Add into x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add into y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add into z correct", z1 + z2, q.z );
			Assert.assertEquals( "Add into w correct", 0, q.w );
			Assert.assertStrictlyEquals( "Add into returns correct", q, r );
		}

		[Test]
		public function subtract() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = p.subtract( v );
			Assert.assertEquals( "Subtract x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract z correct", z1 - z2, q.z );
			Assert.assertEquals( "Subtract w correct", 0, q.w );
		}

		[Test]
		public function subtractInto() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = new Vector3d();
			var r : Vector3d = p.subtract( v, q );
			Assert.assertEquals( "Subtract into x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract into y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract into z correct", z1 - z2, q.z );
			Assert.assertEquals( "Subtract into w correct", 0, q.w );
			Assert.assertStrictlyEquals( "Subtract into returns correct", q, r );
		}

		[Test]
		public function multiply() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.multiply( x2 );
			Assert.assertEquals( "Multiply x correct", x1 * x2, q.x );
			Assert.assertEquals( "Multiply y correct", y1 * x2, q.y );
			Assert.assertEquals( "Multiply z correct", z1 * x2, q.z );
			Assert.assertEquals( "Multiply w correct", 0, q.w );
		}

		[Test]
		public function multiplyInto() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d();
			var r : Vector3d = p.multiply( x2, q );
			Assert.assertEquals( "Multiply into x correct", x1 * x2, q.x );
			Assert.assertEquals( "Multiply into y correct", y1 * x2, q.y );
			Assert.assertEquals( "Multiply into z correct", z1 * x2, q.z );
			Assert.assertEquals( "Multiply into w correct", 0, q.w );
			Assert.assertStrictlyEquals( "Multiply into returns correct", q, r );
		}

		[Test]
		public function divide() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.divide( x2 );
			Assert.assertTrue( "Divide x correct", near( x1 / x2, q.x ) );
			Assert.assertTrue( "Divide y correct", near( y1 / x2, q.y ) );
			Assert.assertTrue( "Divide z correct", near( z1 / x2, q.z ) );
			Assert.assertEquals( "Divide w correct", 0, q.w );
		}

		[Test]
		public function divideInto() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d();
			var r : Vector3d = p.divide( x2, q );
			Assert.assertTrue( "Divide into x correct", near( x1 / x2, q.x ) );
			Assert.assertTrue( "Divide into y correct", near( y1 / x2, q.y ) );
			Assert.assertTrue( "Divide into z correct", near( z1 / x2, q.z ) );
			Assert.assertEquals( "Divide into w correct", 0, q.w );
			Assert.assertStrictlyEquals( "Divide into returns correct", q, r );
		}
		
		[Test]
		public function incrementBy() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = p.incrementBy( v );
			Assert.assertEquals( "IncrementBy x correct", x1 + x2, p.x );
			Assert.assertEquals( "IncrementBy y correct", y1 + y2, p.y );
			Assert.assertEquals( "IncrementBy z correct", z1 + z2, p.z );
			Assert.assertEquals( "IncrementBy w correct", 0, p.w );
			Assert.assertStrictlyEquals( "IncrementBy returns correct", p, q );
		}

		[Test]
		public function decrementBy() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var v : Vector3d = new Vector3d( x2, y2, z2 );
			var q : Vector3d = p.decrementBy( v );
			Assert.assertEquals( "DecrementBy x correct", x1 - x2, p.x );
			Assert.assertEquals( "DecrementBy y correct", y1 - y2, p.y );
			Assert.assertEquals( "DecrementBy z correct", z1 - z2, p.z );
			Assert.assertEquals( "DecrementBy w correct", 0, p.w );
			Assert.assertStrictlyEquals( "DecrementBy returns correct", p, q );
		}

		[Test]
		public function scaleBy() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.scaleBy( x2 );
			Assert.assertEquals( "ScaleBy x correct", x1 * x2, p.x );
			Assert.assertEquals( "ScaleBy y correct", y1 * x2, p.y );
			Assert.assertEquals( "ScaleBy z correct", z1 * x2, p.z );
			Assert.assertEquals( "ScaleBy w correct", 0, p.w );
			Assert.assertStrictlyEquals( "ScaleBy returns correct", p, q );
		}

		[Test]
		public function divideBy() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.divideBy( x2 );
			Assert.assertTrue( "DivideBy x correct", near( x1 / x2, q.x ) );
			Assert.assertTrue( "DivideBy y correct", near( y1 / x2, q.y ) );
			Assert.assertTrue( "DivideBy z correct", near( z1 / x2, q.z ) );
			Assert.assertEquals( "DivideBy w correct", 0, q.w );
			Assert.assertStrictlyEquals( "DivideBy returns correct", p, q );
		}

		[Test]
		public function equals() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x1, y1, z1 );
			Assert.assertTrue( "Equals is true", p.equals( q ) );
		}
		
		[Test]
		public function notEquals() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x2, y2, z2 );
			Assert.assertFalse( "Equals is false", p.equals( q ) );
		}

		[Test]
		public function nearEquals() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x1 + 0.01, y1 + 0.01, z1 + 0.01 );
			Assert.assertTrue( "Equals is true", p.nearEquals( q, 0.1 ) );
		}
		
		[Test]
		public function notNearEquals() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x1 + 0.09, y1 + 0.09, z1 + 0.09 );
			Assert.assertFalse( "Equals is false", p.nearEquals( q, 0.1 ) );
		}
		
		[Test]
		public function dotProduct() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x2, y2, z2 );
			var d : Number = p.dotProduct( q );
			Assert.assertEquals( "Dot product is correct", p.x * q.x + p.y * q.y + p.z * q.z, d );
		}
		
		[Test]
		public function crossProduct() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = new Vector3d( x2, y2, z2 );
			var v : Vector3d = p.crossProduct( q );
			Assert.assertEquals( "Cross product x is correct", p.y * q.z - p.z * q.y, v.x );
			Assert.assertEquals( "Cross product y is correct", p.z * q.x - p.x * q.z, v.y );
			Assert.assertEquals( "Cross product z is correct", p.x * q.y - p.y * q.x, v.z );
			Assert.assertEquals( "Cross product w is correct", 0, v.w );
		}

		[Test]
		public function length() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var l : Number = Math.sqrt( x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Length correct", near( l, p.length ) );
		}

		[Test]
		public function lengthSquared() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var l : Number = x1 * x1 + y1 * y1 + z1 * z1;
			Assert.assertEquals( "Length squared correct", l, p.lengthSquared );
		}

		[Test]
		public function negative() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.negative();
			Assert.assertEquals( "Negative x correct", -x1, q.x );
			Assert.assertEquals( "Negative y correct", -y1, q.y );
			Assert.assertEquals( "Negative z correct", -z1, q.z );
			Assert.assertEquals( "Negative w correct", 0, q.w );
		}

		[Test]
		public function negate() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.negate();
			Assert.assertEquals( "Negate x correct", -x1, p.x );
			Assert.assertEquals( "Negate y correct", -y1, p.y );
			Assert.assertEquals( "Negate z correct", -z1, p.z );
			Assert.assertEquals( "Negate w correct", 0, p.w );
			Assert.assertStrictlyEquals( "Negate returns correct", q, p );
		}

		[Test]
		public function normalize() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.normalize();
			var l : Number = Math.sqrt( x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Normalize x correct", near( x1 / l, p.x ) );
			Assert.assertTrue( "Normalize y correct", near( y1 / l, p.y ) );
			Assert.assertTrue( "Normalize z correct", near( z1 / l, p.z ) );
			Assert.assertEquals( "Normalize w correct", 0, p.w );
			Assert.assertStrictlyEquals( "Normalize returns correct", q, p );
		}

		[Test]
		public function unit() : void
		{
			var p : Vector3d = new Vector3d( x1, y1, z1 );
			var q : Vector3d = p.unit();
			var l : Number = Math.sqrt( x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Normalize x correct", near( x1 / l, q.x ) );
			Assert.assertTrue( "Normalize y correct", near( y1 / l, q.y ) );
			Assert.assertTrue( "Normalize z correct", near( z1 / l, q.z ) );
			Assert.assertEquals( "Normalize w correct", 0, q.w );
		}
	}
}
