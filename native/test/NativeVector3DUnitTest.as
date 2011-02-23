package test
{
	import org.flexunit.Assert;

	import flash.geom.Vector3D;

	public class NativeVector3DUnitTest
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
			var p : Vector3D = new Vector3D( x1, y1, z1, w1 );
			Assert.assertEquals( "Set x correct", x1, p.x );
			Assert.assertEquals( "Set t correct", y1, p.y );
			Assert.assertEquals( "Set z correct", z1, p.z );
			Assert.assertEquals( "Set w correct", w1, p.w );
		}

		[Test]
		public function emptyCreation() : void
		{
			var p : Vector3D = new Vector3D();
			Assert.assertEquals( "Set default x correct", 0, p.x );
			Assert.assertEquals( "Set default y correct", 0, p.y );
			Assert.assertEquals( "Set default z correct", 0, p.z );
			Assert.assertEquals( "Set default w correct", 0, p.w );
		}

		[Test] // Fails: Vector3D.X_AXIS always returns the same object
		public function xAxis() : void
		{
			var p : Vector3D = Vector3D.X_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3D.X_AXIS );
			Assert.assertEquals( "Zero x correct", 1, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test] // Fails: Vector3D.Y_AXIS always returns the same object
		public function yAxis() : void
		{
			var p : Vector3D = Vector3D.Y_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3D.Y_AXIS );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 1, p.y );
			Assert.assertEquals( "Zero z correct", 0, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test] // Fails: Vector3D.Z_AXIS always returns the same object
		public function zAxis() : void
		{
			var p : Vector3D = Vector3D.Z_AXIS;
			Assert.assertFalse( "Vector is copy", p == Vector3D.Z_AXIS );
			Assert.assertEquals( "Zero x correct", 0, p.x );
			Assert.assertEquals( "Zero y correct", 0, p.y );
			Assert.assertEquals( "Zero z correct", 1, p.z );
			Assert.assertEquals( "Zero w correct", 0, p.w );
		}

		[Test]
		public function clone() : void
		{
			var q : Vector3D = new Vector3D( x1, y1, z1, w1 );
			var p : Vector3D = q.clone();

			Assert.assertFalse( "Clone is copy", p == q );
			Assert.assertEquals( "Clone x correct", x1, p.x );
			Assert.assertEquals( "Clone t correct", y1, p.y );
			Assert.assertEquals( "Clone z correct", z1, p.z );
			Assert.assertEquals( "Clone w correct", w1, p.w );
		}

		[Test]
		public function add() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var v : Vector3D = new Vector3D( x2, y2, z2 );
			var q : Vector3D = p.add( v );
			Assert.assertEquals( "Add x correct", x1 + x2, q.x );
			Assert.assertEquals( "Add y correct", y1 + y2, q.y );
			Assert.assertEquals( "Add z correct", z1 + z2, q.z );
			Assert.assertEquals( "Add w correct", 0, q.w );
		}

		[Test]
		public function subtract() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var v : Vector3D = new Vector3D( x2, y2, z2 );
			var q : Vector3D = p.subtract( v );
			Assert.assertEquals( "Subtract x correct", x1 - x2, q.x );
			Assert.assertEquals( "Subtract y correct", y1 - y2, q.y );
			Assert.assertEquals( "Subtract z correct", z1 - z2, q.z );
			Assert.assertEquals( "Subtract w correct", 0, q.w );
		}
		
		[Test]
		public function incrementBy() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var v : Vector3D = new Vector3D( x2, y2, z2 );
			p.incrementBy( v );
			Assert.assertEquals( "IncrementBy x correct", x1 + x2, p.x );
			Assert.assertEquals( "IncrementBy y correct", y1 + y2, p.y );
			Assert.assertEquals( "IncrementBy z correct", z1 + z2, p.z );
			Assert.assertEquals( "IncrementBy w correct", 0, p.w );
		}

		[Test]
		public function decrementBy() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var v : Vector3D = new Vector3D( x2, y2, z2 );
			p.decrementBy( v );
			Assert.assertEquals( "DecrementBy x correct", x1 - x2, p.x );
			Assert.assertEquals( "DecrementBy y correct", y1 - y2, p.y );
			Assert.assertEquals( "DecrementBy z correct", z1 - z2, p.z );
			Assert.assertEquals( "DecrementBy w correct", 0, p.w );
		}

		[Test]
		public function scaleBy() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			p.scaleBy( x2 );
			Assert.assertEquals( "ScaleBy x correct", x1 * x2, p.x );
			Assert.assertEquals( "ScaleBy y correct", y1 * x2, p.y );
			Assert.assertEquals( "ScaleBy z correct", z1 * x2, p.z );
			Assert.assertEquals( "ScaleBy w correct", 0, p.w );
		}

		[Test]
		public function equals() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var q : Vector3D = new Vector3D( x1, y1, z1 );
			Assert.assertTrue( "Equals is true", p.equals( q ) );
		}
		
		[Test]
		public function notEquals() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var q : Vector3D = new Vector3D( x2, y2, z2 );
			Assert.assertFalse( "Equals is false", p.equals( q ) );
		}

		[Test]
		public function nearEquals() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var q : Vector3D = new Vector3D( x1 + 0.01, y1 + 0.01, z1 + 0.01 );
			Assert.assertTrue( "Equals is true", p.nearEquals( q, 0.1 ) );
		}
		
		[Test]
		public function notNearEquals() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var q : Vector3D = new Vector3D( x1 + 0.11, y1 + 0.11, z1 + 0.11 );
			Assert.assertFalse( "Equals is false", p.nearEquals( q, 0.1 ) );
		}
		
		[Test]
		public function dotProduct() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var q : Vector3D = new Vector3D( x2, y2, z2 );
			var d : Number = p.dotProduct( q );
			Assert.assertEquals( "Dot product is correct", p.x * q.x + p.y * q.y + p.z * q.z, d );
		}
		
		[Test] // Fails: crossProduct() sets w coordinate to 1
		public function crossProduct() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1, 0 );
			var q : Vector3D = new Vector3D( x2, y2, z2, 0 );
			var v : Vector3D = p.crossProduct( q );
			Assert.assertEquals( "Cross product x is correct", p.y * q.z - p.z * q.y, v.x );
			Assert.assertEquals( "Cross product y is correct", p.z * q.x - p.x * q.z, v.y );
			Assert.assertEquals( "Cross product z is correct", p.x * q.y - p.y * q.x, v.z );
			Assert.assertEquals( "Cross product w is correct", 0, v.w );
		}

		[Test]
		public function length() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var l : Number = Math.sqrt( x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Length correct", near( l, p.length ) );
		}

		[Test]
		public function lengthSquared() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			var l : Number = x1 * x1 + y1 * y1 + z1 * z1;
			Assert.assertEquals( "Length squared correct", l, p.lengthSquared );
		}

		[Test]
		public function negate() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			p.negate();
			Assert.assertEquals( "Negate x correct", -x1, p.x );
			Assert.assertEquals( "Negate y correct", -y1, p.y );
			Assert.assertEquals( "Negate z correct", -z1, p.z );
			Assert.assertEquals( "Negate w correct", 0, p.w );
		}

		[Test]
		public function normalize() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1 );
			p.normalize();
			var l : Number = Math.sqrt( x1 * x1 + y1 * y1 + z1 * z1 );
			Assert.assertTrue( "Normalize x correct", near( x1 / l, p.x ) );
			Assert.assertTrue( "Normalize y correct", near( y1 / l, p.y ) );
			Assert.assertTrue( "Normalize z correct", near( z1 / l, p.z ) );
			Assert.assertEquals( "Normalize w correct", 0, p.w );
		}
		
		[Test]
		public function project() : void
		{
			var p : Vector3D = new Vector3D( x1, y1, z1, w1 );
			p.project();
			Assert.assertTrue( "Project x correct", near( x1 / w1, p.x ) );
			Assert.assertTrue( "Project y correct", near( y1 / w1, p.y ) );
			Assert.assertTrue( "Project z correct", near( z1 / w1, p.z ) );
			Assert.assertEquals( "Project w correct", w1, p.w );
		}

	}
}
