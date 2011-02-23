package net.richardlord.coral
{
	import org.flexunit.Assert;

	use namespace coral_internal;
	
	public class QuaternionUnitTest
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
		
		private function near( a:Number, b:Number, e:Number = 0.0000001 ) : Boolean
		{
			return Math.abs( a - b ) < e;
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
			var q : Quaternion = new Quaternion( w1, x1, y1, z1 );
			Assert.assertEquals( "Set w correct", w1, q.w );
			Assert.assertEquals( "Set x correct", x1, q.x );
			Assert.assertEquals( "Set t correct", y1, q.y );
			Assert.assertEquals( "Set z correct", z1, q.z );
		}

		[Test]
		public function emptyCreation() : void
		{
			var q : Quaternion = new Quaternion();
			Assert.assertEquals( "Set default x correct", 0, q.x );
			Assert.assertEquals( "Set default y correct", 0, q.y );
			Assert.assertEquals( "Set default z correct", 0, q.z );
			Assert.assertEquals( "Set default w correct", 1, q.w );
		}

		[Test]
		public function zero() : void
		{
			var q : Quaternion = Quaternion.ZERO;
			Assert.assertFalse( "Zero quaternion is copy", q == Quaternion.ZERO );
			Assert.assertEquals( "Zero x correct", 0, q.x );
			Assert.assertEquals( "Zero y correct", 0, q.y );
			Assert.assertEquals( "Zero z correct", 0, q.z );
			Assert.assertEquals( "Zero w correct", 0, q.w );
		}

		[Test]
		public function identity() : void
		{
			var q : Quaternion = Quaternion.IDENTITY;
			Assert.assertFalse( "Identity quaternion is copy", q == Quaternion.IDENTITY );
			Assert.assertEquals( "Identity x correct", 0, q.x );
			Assert.assertEquals( "Identity y correct", 0, q.y );
			Assert.assertEquals( "Identity z correct", 0, q.z );
			Assert.assertEquals( "Identity w correct", 1, q.w );
		}

		[Test]
		public function reset() : void
		{
			var q : Quaternion = new Quaternion( w2, x2, y2, z2 );
			q.reset( w1, x1, y1, z1 );
			Assert.assertEquals( "Reset w correct", w1, q.w );
			Assert.assertEquals( "Reset x correct", x1, q.x );
			Assert.assertEquals( "Reset t correct", y1, q.y );
			Assert.assertEquals( "Reset z correct", z1, q.z );
		}

		[Test]
		public function assign() : void
		{
			var q : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var r : Quaternion = new Quaternion( w1, x1, y1, z1 );
			q.assign( r );

			Assert.assertEquals( "Assign w correct", w1, q.w );
			Assert.assertEquals( "Assign x correct", x1, q.x );
			Assert.assertEquals( "Assign t correct", y1, q.y );
			Assert.assertEquals( "Assign z correct", z1, q.z );
		}

		[Test]
		public function clone() : void
		{
			var q : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = q.clone();

			Assert.assertFalse( "Clone is copy", r == q );
			Assert.assertEquals( "Clone x correct", x1, r.x );
			Assert.assertEquals( "Clone t correct", y1, r.y );
			Assert.assertEquals( "Clone z correct", z1, r.z );
			Assert.assertEquals( "Clone w correct", w1, r.w );
		}

		[Test]
		public function add() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = p.add( r );
			Assert.assertEquals( "Add w correct", w1 + w2, q.w );
			Assert.assertEquals( "Add x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add z correct", z1 + z2, q.z );
		}

		[Test]
		public function addInto() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var s : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = new Quaternion();
			var r : Quaternion = p.add( s, q );
			Assert.assertEquals( "Add into w correct", w1 + w2, q.w );
			Assert.assertEquals( "Add into x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add into y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add into z correct", z1 + z2, q.z );
			Assert.assertStrictlyEquals( "Add into returns correct", q, r );
		}

		[Test]
		public function subtract() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = p.subtract( r );
			Assert.assertEquals( "Subtract w correct", w1 - w2, q.w );
			Assert.assertEquals( "Subtract x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract z correct", z1 - z2, q.z );
		}

		[Test]
		public function subtractInto() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var s : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = new Quaternion();
			var r : Quaternion = p.subtract( s, q );
			Assert.assertEquals( "Subtract into w correct", w1 - w2, q.w );
			Assert.assertEquals( "Subtract into x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract into y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract into z correct", z1 - z2, q.z );
			Assert.assertStrictlyEquals( "Subtract into returns correct", q, r );
		}
		
		[Test]
		public function scalarMultiply() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = p.scalarMultiply( x2 );
			Assert.assertEquals( "Multiply w correct", w1 * x2, q.w );
			Assert.assertEquals( "Multiply x correct", x1 * x2, q.x );
			Assert.assertEquals( "Multiply y correct", y1 * x2, q.y );
			Assert.assertEquals( "Multiply z correct", z1 * x2, q.z );
		}

		[Test]
		public function scalarMultiplyInto() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion();
			var r : Quaternion = p.scalarMultiply( x2, q );
			Assert.assertEquals( "Multiply into w correct", w1 * x2, q.w );
			Assert.assertEquals( "Multiply into x correct", x1 * x2, q.x );
			Assert.assertEquals( "Multiply into y correct", y1 * x2, q.y );
			Assert.assertEquals( "Multiply into z correct", z1 * x2, q.z );
			Assert.assertStrictlyEquals( "Multiply into returns correct", q, r );
		}
		
		[Test]
		public function incrementBy() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = p.incrementBy( r );
			Assert.assertEquals( "IncrementBy w correct", w1 + w2, p.w );
			Assert.assertEquals( "IncrementBy x correct", x1 + x2, p.x );
			Assert.assertEquals( "IncrementBy y correct", y1 + y2, p.y );
			Assert.assertEquals( "IncrementBy z correct", z1 + z2, p.z );
			Assert.assertStrictlyEquals( "IncrementBy returns correct", p, q );
		}

		[Test]
		public function decrementBy() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var q : Quaternion = p.decrementBy( r );
			Assert.assertEquals( "DecrementBy w correct", w1 - w2, p.w );
			Assert.assertEquals( "DecrementBy x correct", x1 - x2, p.x );
			Assert.assertEquals( "DecrementBy y correct", y1 - y2, p.y );
			Assert.assertEquals( "DecrementBy z correct", z1 - z2, p.z );
			Assert.assertStrictlyEquals( "DecrementBy returns correct", p, q );
		}

		[Test]
		public function scaleBy() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = p.scaleBy( x2 );
			Assert.assertEquals( "ScaleBy w correct", w1 * x2, p.w );
			Assert.assertEquals( "ScaleBy x correct", x1 * x2, p.x );
			Assert.assertEquals( "ScaleBy y correct", y1 * x2, p.y );
			Assert.assertEquals( "ScaleBy z correct", z1 * x2, p.z );
			Assert.assertStrictlyEquals( "ScaleBy returns correct", p, q );
		}

		[Test]
		public function equals() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1, x1, y1, z1 );
			Assert.assertTrue( "Equals is true", p.equals( q ) );
		}
		
		[Test]
		public function notEquals() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w2, x2, y2, z2 );
			Assert.assertFalse( "Equals is false", p.equals( q ) );
		}

		[Test]
		public function nearEquals() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1 + 0.01, x1 + 0.01, y1 + 0.01, z1 + 0.01 );
			Assert.assertTrue( "Equals is true", p.nearEquals( q, 0.1 ) );
		}
		
		[Test]
		public function notNearEquals() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1 + 0.09, x1 + 0.09, y1 + 0.09, z1 + 0.09 );
			Assert.assertFalse( "Equals is false", p.nearEquals( q, 0.1 ) );
		}

		[Test]
		public function magnitude() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var l : Number = Math.sqrt( w1 * w1 + x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Magnitude correct", near( l, p.magnitude ) );
		}

		[Test]
		public function magnitudeSquared() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var l : Number = w1 * w1 + x1 * x1 + y1 * y1 + z1 * z1;
			Assert.assertEquals( "Magnitude squared correct", l, p.magnitudeSquared );
		}

		[Test]
		public function dotProduct() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w2, x2, y2, z2 );
			var d : Number = p.dotProduct( q );
			Assert.assertEquals( "Dot product is correct", p.w * q.w + p.x * q.x + p.y * q.y + p.z * q.z, d );
		}
		
		[Test]
		public function conjugate() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1, -x1, -y1, -z1 );
			Assert.assertTrue( "Conjugate correct", q.equals( p.conjugate() ) );
		}
		
		[Test]
		public function conjugateInto() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1, -x1, -y1, -z1 );
			var r : Quaternion = new Quaternion();
			p.conjugate( r );
			Assert.assertTrue( "Conjugate correct", q.equals( r ) );
		}
		
		[Test]
		public function selfConjugate() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1, -x1, -y1, -z1 );
			var r : Quaternion = p.selfConjugate();
			Assert.assertTrue( "Make conjugate correct", q.equals( p ) );
			Assert.assertEquals( "Make conjugate returns correct", p, r );
		}

		[Test]
		public function invert() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion( w1, x1, y1, z1 );
			q.invert();
			var r: Quaternion = p.preMultiply( q );
			Assert.assertTrue( "Invert preMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
			r = p.postMultiply( q );
			Assert.assertTrue( "Invert postMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
		}

		[Test]
		public function inverse() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = p.inverse();
			var r: Quaternion = p.preMultiply( q );
			Assert.assertTrue( "Inverse preMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
			r = p.postMultiply( q );
			Assert.assertTrue( "Inverse postMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
		}

		[Test]
		public function inverseInto() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var q : Quaternion = new Quaternion();
			var s : Quaternion = p.inverse( q );
			Assert.assertEquals( "Inverse into returns result", s, q );
			var r: Quaternion = p.preMultiply( q );
			Assert.assertTrue( "Inverse into preMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
			r = p.postMultiply( q );
			Assert.assertTrue( "Inverse into postMultiply correct", r.nearEquals( Quaternion.IDENTITY, 0.00001 ) );
		}
		
		[Test]
		public function normalize() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			p.normalize();
			Assert.assertTrue( "Normalize has unit length", near( p.magnitude, 1 ) );
			Assert.assertTrue( "Normalize has correct ratio on x", near( p.x / p.w, x1 / w1 ) );
			Assert.assertTrue( "Normalize has correct ratio on y", near( p.y / p.w, y1 / w1 ) );
			Assert.assertTrue( "Normalize has correct ratio on z", near( p.z / p.w, z1 / w1 ) );
		}
		
		[Test]
		public function unit() : void
		{
			var p : Quaternion = new Quaternion( w1, x1, y1, z1 );
			var r : Quaternion = new Quaternion();
			var q : Quaternion = p.unit( r );
			Assert.assertEquals( "Returned object is result object", q, r );
			Assert.assertTrue( "Unit has unit length", near( q.magnitude, 1 ) );
			Assert.assertTrue( "Unit has correct ratio on x", near( q.x / q.w, x1 / w1 ) );
			Assert.assertTrue( "Unit has correct ratio on y", near( q.y / q.w, y1 / w1 ) );
			Assert.assertTrue( "Unit has correct ratio on z", near( q.z / q.w, z1 / w1 ) );
			Assert.assertEquals( "Original quaternion w unchanged", p.w, w1 );
			Assert.assertEquals( "Original quaternion w unchanged", p.x, x1 );
			Assert.assertEquals( "Original quaternion w unchanged", p.y, y1 );
			Assert.assertEquals( "Original quaternion w unchanged", p.z, z1 );
		}

	}
}
