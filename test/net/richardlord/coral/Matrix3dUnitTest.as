package net.richardlord.coral
{
	import org.flexunit.Assert;

	use namespace coral_internal;
	
	public class Matrix3dUnitTest
	{
		private var e : Number = 0.000001;
		
		private var matrix1 : Matrix3d;
		private var determinant1 : Number;
		private var inverse1 : Matrix3d;
		
		private var matrix2 : Matrix3d;
		private var determinant2 : Number;
		private var inverse2 : Matrix3d;
		
		private var pre1 : Matrix3d;
		private var post1 : Matrix3d;
		private var result1 : Matrix3d;
		
		private var pre2 : Matrix3d;
		private var post2 : Matrix3d;
		private var result2 : Matrix3d;
		
		private var transform1 : Matrix3d;
		private var point1 : Point3d;
		private var vector1 : Vector3d;
		private var transformedPoint1 : Point3d;
		private var transformedVector1 : Vector3d;
		
		private var transform2 : Matrix3d;
		private var point2 : Point3d;
		private var vector2 : Vector3d;
		private var transformedPoint2 : Point3d;
		private var transformedVector2 : Vector3d;
		
		private var transform3 : Matrix3d;
		private var point3 : Point3d;
		private var vector3 : Vector3d;
		private var transformedPoint3 : Point3d;
		private var transformedVector3 : Vector3d;
		
		[Before]
		public function createData() : void
		{
			matrix1 = new Matrix3d( 1, 2, 3, 1, 2, 3, 1, 2, 1, 1, 2, 3, 2, 2, 3, 3 );
			determinant1 = 10;
			inverse1 = new Matrix3d( -0.8, -0.2, -1.4, 1.8, 0.5, 0.5, 0.5, -1, 0.3, -0.3, -0.1, 0.2, -0.1, 0.1, 0.7, -0.4 );
			
			matrix2 = new Matrix3d( 2, -1, 3, 0, 1, 3, 2, 1, -1, -2, -2, 1, 0, 0, 0, 1 );
			determinant2 = -1;
			inverse2 = new Matrix3d( 2, 8, 11, -19, 0, 1, 1, -2, -1, -5, -7, 12, 0, 0, 0, 1 );
			
			pre1 = new Matrix3d( 1, 2, 3, 4, 2, 3, 3, 2, 1, 2, 4, 4, 4, 1, 2, 1 );
			post1 = new Matrix3d( 3, 1, 2, 3, 2, 1, 2, 4, 4, 1, 2, 1, 2, 3, 4, 4 );
			result1 = new Matrix3d( 27, 18, 28, 30, 28, 14, 24, 29, 31, 19, 30, 31, 24, 10, 18, 22 );
			
			pre2 = new Matrix3d( 2, 3, 2, 3, 1, 5, 4, 3, 4, 2, 4, 5, 1, 2, 1, 1 );
			post2 = new Matrix3d( 3, 2, 4, 3, 2, 1, 2, 3, 4, 2, 3, 1, 3, 4, 2, 1 );
			result2 = new Matrix3d( 29, 23, 26, 20, 38, 27, 32, 25, 47, 38, 42, 27, 14, 10, 13, 11 );
			
			transform1 = new Matrix3d( 1, 2, 4, 3, 4, 3, 2, 1, 2, 4, 3, 2, 0, 0, 0, 1 );
			point1 = new Point3d( 2, 3, 1 );
			transformedPoint1 = new Point3d( 15, 20, 21 );
			vector1 = new Vector3d( 2, 3, 1 );
			transformedVector1 = new Vector3d( 12, 19, 19 );
			
			transform2 = new Matrix3d( 4, 2, 2, 3, 1, -2, 4, -1, 3, 2, 1, 1, 3, 2, 2, 4 );
			point2 = new Point3d( -3, 2, 2 );
			transformedPoint2 = new Point3d( -1, 0, -2 );
			transformedPoint2.w = 3;
			vector2 = new Vector3d( -3, 2, 2 );
			transformedVector2 = new Vector3d( -4, 1, -3 );
			transformedVector2.w = -1;
			
			transform3 = new Matrix3d( 1, 3, 2, 1, -2, 1, -1, 3, 4, 1, 3, 3, 2, -1, 2, 4 );
			point3 = new Point3d( 2, -1, 3 );
			point3.w = 2;
			transformedPoint3 = new Point3d( 7, -2, 22 );
			transformedPoint3.w = 19;
			vector3 = new Vector3d( 2, -1, 3 );
			vector3.w = 2;
			transformedVector3 = new Vector3d( 7, -2, 22 );
			transformedVector3.w = 19;
		}
		
		[Test]
		public function identity() : void
		{
			Assert.assertTrue( "Identity matrix correct", Matrix3d.IDENTITY.equals( new Matrix3d( 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 ) ) );
			Assert.assertFalse( "Identity matrix new each time", Matrix3d.IDENTITY == Matrix3d.IDENTITY );
			Assert.assertTrue( "Identity matrices are equal", Matrix3d.IDENTITY.equals( Matrix3d.IDENTITY ) );
			var random : Matrix3d = randomMatrix();
			var m:Matrix3d = random.clone();
			m.append( Matrix3d.IDENTITY );
			Assert.assertTrue( "Identity matrix has no effect", m.equals( random ) );
			m = random.clone();
			m.prepend( Matrix3d.IDENTITY );
			Assert.assertTrue( "Identity matrix has no effect", m.equals( random ) );
		}

		[Test]
		public function zero() : void
		{
			Assert.assertTrue( "Zero matrix is zero", Matrix3d.ZERO.equals( new Matrix3d( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ) ) );
			Assert.assertFalse( "Zero matrix new each time", Matrix3d.ZERO == Matrix3d.ZERO );
			Assert.assertTrue( "Zero matrices are equal", Matrix3d.ZERO.equals( Matrix3d.ZERO ) );
			var random : Matrix3d = randomMatrix();
			var m:Matrix3d = random.clone();
			m.append( Matrix3d.ZERO );
			Assert.assertTrue( "Zero matrix produces zero", m.equals( Matrix3d.ZERO ) );
			m = random.clone();
			m.prepend( Matrix3d.ZERO );
			Assert.assertTrue( "Zero matrix produces zero", m.equals( Matrix3d.ZERO ) );
		}

		[Test]
		public function constructIdentity() : void
		{
			Assert.assertTrue( "Default constructor is identity", Matrix3d.IDENTITY.equals( new Matrix3d() ) );
		}

		[Test]
		public function construct() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 16 );
			var matrix : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );

			Assert.assertEquals( "Construct row 1 column 1 correct", matrix.n11, a[0] );
			Assert.assertEquals( "Construct row 1 column 2 correct", matrix.n12, a[1] );
			Assert.assertEquals( "Construct row 1 column 3 correct", matrix.n13, a[2] );
			Assert.assertEquals( "Construct row 1 column 4 correct", matrix.n14, a[3] );
			Assert.assertEquals( "Construct row 2 column 1 correct", matrix.n21, a[4] );
			Assert.assertEquals( "Construct row 2 column 2 correct", matrix.n22, a[5] );
			Assert.assertEquals( "Construct row 2 column 3 correct", matrix.n23, a[6] );
			Assert.assertEquals( "Construct row 2 column 4 correct", matrix.n24, a[7] );
			Assert.assertEquals( "Construct row 3 column 1 correct", matrix.n31, a[8] );
			Assert.assertEquals( "Construct row 3 column 2 correct", matrix.n32, a[9] );
			Assert.assertEquals( "Construct row 3 column 3 correct", matrix.n33, a[10] );
			Assert.assertEquals( "Construct row 3 column 4 correct", matrix.n34, a[11] );
			Assert.assertEquals( "Construct row 4 column 1 correct", matrix.n41, a[12] );
			Assert.assertEquals( "Construct row 4 column 2 correct", matrix.n42, a[13] );
			Assert.assertEquals( "Construct row 4 column 3 correct", matrix.n43, a[14] );
			Assert.assertEquals( "Construct row 4 column 4 correct", matrix.n44, a[15] );
		}

		[Test]
		public function assign() : void
		{
			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = new Matrix3d();
			var m3 : Matrix3d = m2.assign( m1 );
			Assert.assertTrue( "Matrices are equal", m1.equals( m2 ) );
			Assert.assertEquals( "Copy returns the copy", m2, m3 );
		}

		[Test]
		public function clone() : void
		{
			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();

			Assert.assertEquals( "Clone row 1 column 1 equals", m1.n11, m2.n11 );
			Assert.assertEquals( "Clone row 1 column 2 equals", m1.n12, m2.n12 );
			Assert.assertEquals( "Clone row 1 column 3 equals", m1.n13, m2.n13 );
			Assert.assertEquals( "Clone row 1 column 4 equals", m1.n14, m2.n14 );
			Assert.assertEquals( "Clone row 2 column 1 equals", m1.n21, m2.n21 );
			Assert.assertEquals( "Clone row 2 column 2 equals", m1.n22, m2.n22 );
			Assert.assertEquals( "Clone row 2 column 3 equals", m1.n23, m2.n23 );
			Assert.assertEquals( "Clone row 2 column 4 equals", m1.n24, m2.n24 );
			Assert.assertEquals( "Clone row 3 column 1 equals", m1.n31, m2.n31 );
			Assert.assertEquals( "Clone row 3 column 2 equals", m1.n32, m2.n32 );
			Assert.assertEquals( "Clone row 3 column 3 equals", m1.n33, m2.n33 );
			Assert.assertEquals( "Clone row 3 column 4 equals", m1.n34, m2.n34 );
			Assert.assertEquals( "Clone row 4 column 1 equals", m1.n41, m2.n41 );
			Assert.assertEquals( "Clone row 4 column 2 equals", m1.n42, m2.n42 );
			Assert.assertEquals( "Clone row 4 column 3 equals", m1.n43, m2.n43 );
			Assert.assertEquals( "Clone row 4 column 4 equals", m1.n44, m2.n44 );

			Assert.assertFalse( "Cloned matrices are not the same", m1 == m2 );
		}

		[Test]
		public function equals() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 16 );
			var m1 : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			var m2 : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			var m3 : Matrix3d = randomMatrix();
			Assert.assertTrue( "Equals correct when equal", m1.equals( m2 ) );
			Assert.assertFalse( "Equals correct when not equal", m1.equals( m3 ) );
		}

		[Test]
		public function nearEquals() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 16 );
			var m1 : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			for ( var i : uint = 0; i < 16; ++i )
			{
				a[i] += ( Math.random() - 0.5 ) * 2 * e;
			}
			var m2 : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			var m3 : Matrix3d = randomMatrix();

			Assert.assertTrue( "NearEquals correct when equal", m1.nearEquals( m1, e ) );
			Assert.assertTrue( "NearEquals correct when near equal", m1.nearEquals( m2, e ) );
			Assert.assertFalse( "NearEquals correct when not near equal", m1.nearEquals( m3, e ) );
		}

		[Test]
		public function newScale() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();
			var m : Matrix3d = Matrix3d.newScale( x, y, z );
			
			var v : Vector3d = randomVector();
			var w : Vector3d = m.transformVector( v );
			var rv : Vector3d = new Vector3d( v.x * x, v.y * y, v.z * z );
			Assert.assertTrue( "Scale vector correct", w.nearEquals( rv, e ) );
			
			var p : Point3d = randomPoint();
			var q : Point3d = m.transformPoint( p );
			var rp : Point3d = new Point3d( p.x * x, p.y * y, p.z * z );
			Assert.assertTrue( "Scale vector correct", q.nearTo( rp, e ) );
		}

		[Test]
		public function newTranslation() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();
			var m : Matrix3d = Matrix3d.newTranslation( x, y, z );
			
			var v : Vector3d = randomVector();
			var w : Vector3d = m.transformVector( v );
			Assert.assertTrue( "Scale vector correct", w.equals( v ) );
			
			var p : Point3d = randomPoint();
			var q : Point3d = m.transformPoint( p );
			var rp : Point3d = new Point3d( p.x + x, p.y + y, p.z + z );
			Assert.assertTrue( "Scale vector correct", q.nearTo( rp, e ) );
		}

		[Test]
		public function newRotationBasics() : void
		{
			var rad : Number = randomNumber();
			var v : Vector3d = randomVector();
			var p : Point3d = randomPoint();
			var m : Matrix3d = Matrix3d.newRotation( rad, v, p );
			
			var w : Vector3d = m.transformVector( v );
			Assert.assertTrue( "New rotation doesn't transform own axis", w.nearEquals( v, e ) );
			
			var q : Point3d = m.transformPoint( p );
			Assert.assertTrue( "New rotation doesn't transform point on axis", q.nearTo( p, e ) );
			p.incrementBy( v );
			q = m.transformPoint( p );
			Assert.assertTrue( "New rotation doesn't transform point on axis", q.nearTo( p, e ) );
			
			var m2 : Matrix3d = Matrix3d.newRotation( rad, v.unit(), p );
			Assert.assertTrue( "New rotation axis length is irrelevant", m.nearEquals( m2, e ) );
			
			p = randomPoint();
			m = Matrix3d.newRotation( 2 * Math.PI, v, p );
			q = m.transformPoint( p );
			Assert.assertTrue( "New rotation 360 degrees doesn't transform point", q.nearTo( p, e ) );
		}

		[Test]
		public function newRotation() : void
		{
			var p : Point3d = randomPoint();
			var m : Matrix3d = Matrix3d.newRotation( Math.PI * 2 / 3, new Vector3d( 1, 1, 1 ), p );
			
			var v : Vector3d = m.transformVector( Vector3d.X_AXIS );
			Assert.assertTrue( "New rotation transform on x axis", v.nearEquals( Vector3d.Y_AXIS, e ) );
			
			v = m.transformVector( Vector3d.Y_AXIS );
			Assert.assertTrue( "New rotation transform on y axis", v.nearEquals( Vector3d.Z_AXIS, e ) );
			
			v = m.transformVector( Vector3d.Z_AXIS );
			Assert.assertTrue( "New rotation transform on z axis", v.nearEquals( Vector3d.X_AXIS, e ) );
			
			var q : Point3d = m.transformPoint( p.add( Vector3d.X_AXIS ) );
			Assert.assertTrue( "New rotation transform on p + x axis", q.nearTo( p.add( Vector3d.Y_AXIS ), e ) );
			
			q = m.transformPoint( p.add( Vector3d.Y_AXIS ) );
			Assert.assertTrue( "New rotation transform on p + y axis", q.nearTo( p.add( Vector3d.Z_AXIS ), e ) );
			
			q = m.transformPoint( p.add( Vector3d.Z_AXIS ) );
			Assert.assertTrue( "New rotation transform on p + z axis", q.nearTo( p.add( Vector3d.X_AXIS ), e ) );
		}

		[Test]
		public function newBasisTransform() : void
		{
			var x : Vector3d = randomVector();
			var y : Vector3d = randomVector();
			var z : Vector3d = randomVector();
			var a : Vector3d = x.add( y ).add( z );
			var m : Matrix3d = Matrix3d.newBasisTransform( x, y, z );
			var xT : Vector3d = m.transformVector( x );
			var yT : Vector3d = m.transformVector( y );
			var zT : Vector3d = m.transformVector( z );
			var aT : Vector3d = m.transformVector( a );
			Assert.assertTrue( "New basis transform x axis success", Vector3d.X_AXIS.nearEquals( xT, e ) );
			Assert.assertTrue( "New basis transform y axis success", Vector3d.Y_AXIS.nearEquals( yT, e ) );
			Assert.assertTrue( "New basis transform z axis success", Vector3d.Z_AXIS.nearEquals( zT, e ) );
			Assert.assertTrue( "New basis transform z axis success", ( new Vector3d( 1, 1, 1 ) ).nearEquals( aT, e ) );
		}

		[Test]
		public function append() : void
		{
			post1.append( pre1 );
			Assert.assertTrue( "Append 1 success", post1.equals( result1 ) );
			post2.append( pre2 );
			Assert.assertTrue( "Append 2 success", post2.equals( result2 ) );
		}

		[Test]
		public function appendScale() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();
			m1.append( Matrix3d.newScale( x, y, z ) );
			var m3 : Matrix3d = m2.appendScale( x, y, z );
			Assert.assertTrue( "Append scale success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Append scale returns self", m2, m3 );
		}

		[Test]
		public function appendTranslation() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();
			m1.append( Matrix3d.newTranslation( x, y, z ) );
			var m3 : Matrix3d = m2.appendTranslation( x, y, z );
			Assert.assertTrue( "Append translation success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Append translation returns self", m2, m3 );
		}

		[Test]
		public function appendRotation() : void
		{
			var rad : Number = randomNumber() % ( 2 * Math.PI );
			var v : Vector3d = randomVector();
			var p : Point3d = randomPoint();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();

			m1.append( Matrix3d.newRotation( rad, v, p ) );
			var m3 : Matrix3d = m2.appendRotation( rad, v, p );
			Assert.assertTrue( "Append rotation success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Append rotation returns self", m2, m3 );
		}

		[Test]
		public function appendBasisTransform() : void
		{
			var x : Vector3d = randomVector();
			var y : Vector3d = randomVector();
			var z : Vector3d = randomVector();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();

			m1.append( Matrix3d.newBasisTransform( x, y, z ) );
			var m3 : Matrix3d = m2.appendBasisTransform( x, y, z );
			Assert.assertTrue( "Append basis transform success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Append basis transform returns self", m2, m3 );
		}

		[Test]
		public function prepend() : void
		{
			pre1.prepend( post1 );
			Assert.assertTrue( "Prepend 1 success", pre1.equals( result1 ) );
			pre2.prepend( post2 );
			Assert.assertTrue( "Prepend 2 success", pre2.equals( result2 ) );
		}

		[Test]
		public function prependScale() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();
			m1.prepend( Matrix3d.newScale( x, y, z ) );
			var m3 : Matrix3d = m2.prependScale( x, y, z );
			Assert.assertTrue( "Prepend scale success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Prepend scale returns self", m2, m3 );
		}

		[Test]
		public function prependTranslation() : void
		{
			var x : Number = randomNumber();
			var y : Number = randomNumber();
			var z : Number = randomNumber();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();
			m1.prepend( Matrix3d.newTranslation( x, y, z ) );
			var m3 : Matrix3d = m2.prependTranslation( x, y, z );
			Assert.assertTrue( "Prepend translation success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Prepend translation returns self", m2, m3 );
		}

		[Test]
		public function prependRotation() : void
		{
			var rad : Number = randomNumber() % ( 2 * Math.PI );
			var v : Vector3d = randomVector();
			var p : Point3d = randomPoint();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();

			m1.prepend( Matrix3d.newRotation( rad, v, p ) );
			var m3 : Matrix3d = m2.prependRotation( rad, v, p );
			Assert.assertTrue( "Prepend rotation success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Prepend rotation returns self", m2, m3 );
		}

		[Test]
		public function prependBasisTransform() : void
		{
			var x : Vector3d = randomVector();
			var y : Vector3d = randomVector();
			var z : Vector3d = randomVector();

			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();

			m1.prepend( Matrix3d.newBasisTransform( x, y, z ) );
			var m3 : Matrix3d = m2.prependBasisTransform( x, y, z );
			Assert.assertTrue( "Prepend basis transform success", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Prepend basis transform returns self", m2, m3 );
		}

		[Test]
		public function determinant() : void
		{
			Assert.assertEquals( "Matrix 1 determinant correct", matrix1.determinant, determinant1 );
			Assert.assertEquals( "Matrix 2 determinant correct", matrix2.determinant, determinant2 );
		}

		[Test]
		public function invert() : void
		{
			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = m1.clone();
			m2.invert();
			m1.append( m2 );
			Assert.assertTrue( "Random inverse correct", m1.nearEquals( Matrix3d.IDENTITY, e ) );

			matrix1.invert();
			Assert.assertTrue( "Matrix 1 inverse correct", matrix1.nearEquals( inverse1, e ) );
			matrix2.invert();
			Assert.assertTrue( "Matrix 2 inverse correct", matrix2.nearEquals( inverse2, e ) );
		}

		[Test]
		public function inverse() : void
		{
			var m1 : Matrix3d = randomMatrix();
			m1.append( m1.inverse() );
			Assert.assertTrue( "Random invert correct", m1.nearEquals( Matrix3d.IDENTITY, e ) );

			Assert.assertTrue( "Matrix 1 invert correct", inverse1.nearEquals( matrix1.inverse(), e ) );
			Assert.assertTrue( "Matrix 2 invert correct", inverse2.nearEquals( matrix2.inverse(), e ) );
		}

		[Test]
		public function inverseInto() : void
		{
			var m1 : Matrix3d = randomMatrix();
			var m2 : Matrix3d = new Matrix3d();
			var r : Matrix3d = m1.inverse( m2 );
			m1.invert();
			Assert.assertTrue( "Invert into correct", m1.nearEquals( m2, e ) );
			Assert.assertEquals( "Invert into returns result", m2, r );
		}

		[Test]
		public function transformVector() : void
		{
			var v : Vector3d = transform1.transformVector( vector1 );
			Assert.assertTrue( "Vector transform one correct", v.equals( transformedVector1 ) );
			v = transform2.transformVector( vector2 );
			Assert.assertTrue( "Vector transform two correct", v.equals( transformedVector2 ) );
			v = transform3.transformVector( vector3 );
			Assert.assertTrue( "Vector transform three correct", v.equals( transformedVector3 ) );
		}

		[Test]
		public function transformVectorInto() : void
		{
			var v : Vector3d = randomVector();
			var m : Matrix3d = randomMatrix();
			var r1 : Vector3d = new Vector3d();
			var r2 : Vector3d = m.transformVector( v, r1 );
			var r3 : Vector3d = m.transformVector( v );

			Assert.assertTrue( "Vector transform into success", r1.equals( r3 ) );
			Assert.assertEquals( "Vector transform into returns result", r1, r2 );
		}

		[Test]
		public function transformVectorSelf() : void
		{
			var v : Vector3d = randomVector();
			var m : Matrix3d = randomMatrix();
			var r2 : Vector3d = m.transformVector( v );
			var r1 : Vector3d = m.transformVectorSelf( v );

			Assert.assertTrue( "Vector transform self success", v.equals( r2 ) );
			Assert.assertEquals( "Vector transform self returns self", r1, v );
		}

		[Test]
		public function transformVectors() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Vector3d> = new Vector.<Vector3d>();
			v.push( randomVector(), randomVector(), randomVector() );
			var t : Vector.<Vector3d> = new Vector.<Vector3d>();
			t.push( m.transformVector( v[0] ), m.transformVector( v[1] ), m.transformVector( v[2] ) );
			var r : Vector.<Vector3d> = m.transformVectors( v );
			Assert.assertTrue( "Vectors transform first Vector3D", r[0].equals( t[0] ) );
			Assert.assertTrue( "Vectors transform second Vector3D", r[1].equals( t[1] ) );
			Assert.assertTrue( "Vectors transform third Vector3D", r[2].equals( t[2] ) );
		}

		[Test]
		public function transformVectorsInto() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Vector3d> = new Vector.<Vector3d>();
			v.push( randomVector(), randomVector(), randomVector() );
			var t : Vector.<Vector3d> = new Vector.<Vector3d>();
			t.push( m.transformVector( v[0] ), m.transformVector( v[1] ), m.transformVector( v[2] ) );
			var r : Vector.<Vector3d> = new Vector.<Vector3d>();
			r.push(  new Vector3d(),  new Vector3d(),  new Vector3d() );
			m.transformVectors( v, r );
			Assert.assertTrue( "Vectors transform into first Vector3D", r[0].equals( t[0] ) );
			Assert.assertTrue( "Vectors transform into second Vector3D", r[1].equals( t[1] ) );
			Assert.assertTrue( "Vectors transform into third Vector3D", r[2].equals( t[2] ) );
		}

		[Test]
		public function transformVectorsSelf() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Vector3d> = new Vector.<Vector3d>();
			v.push( randomVector(), randomVector(), randomVector() );
			var t : Vector.<Vector3d> = new Vector.<Vector3d>();
			t.push( m.transformVector( v[0] ), m.transformVector( v[1] ), m.transformVector( v[2] ) );
			var r : Vector.<Vector3d> = m.transformVectorsSelf( v );
			Assert.assertTrue( "Vectors transform first Vector3D", v[0].equals( t[0] ) );
			Assert.assertTrue( "Vectors transform second Vector3D", v[1].equals( t[1] ) );
			Assert.assertTrue( "Vectors transform third Vector3D", v[2].equals( t[2] ) );
			Assert.assertEquals( "TransformVectorsSelf returns the result", v, r );
		}

		[Test]
		public function transformPoint() : void
		{
			var p : Point3d = transform1.transformPoint( point1 );
			Assert.assertTrue( "Point transform one correct", p.equals( transformedPoint1 ) );
			p = transform2.transformPoint( point2 );
			Assert.assertTrue( "Point transform two correct", p.equals( transformedPoint2 ) );
			p = transform3.transformPoint( point3 );
			Assert.assertTrue( "Point transform three correct", p.equals( transformedPoint3 ) );
		}

		[Test]
		public function transformPointInto() : void
		{
			var v : Point3d = randomPoint();
			var m : Matrix3d = randomMatrix();
			var r1 : Point3d = new Point3d();
			var r2 : Point3d = m.transformPoint( v, r1 );
			var r3 : Point3d = m.transformPoint( v );

			Assert.assertTrue( "Point transform into success", r1.equals( r3 ) );
			Assert.assertEquals( "Point transform into returns result", r1, r2 );
		}

		[Test]
		public function transformPointSelf() : void
		{
			var v : Point3d = randomPoint();
			var m : Matrix3d = randomMatrix();
			var r2 : Point3d = m.transformPoint( v );
			var r1 : Point3d = m.transformPointSelf( v );

			Assert.assertTrue( "Point transform self success", v.equals( r2 ) );
			Assert.assertEquals( "Point transform self returns self", r1, v );
		}

		[Test]
		public function transformPoints() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Point3d> = new Vector.<Point3d>();
			v.push( randomPoint(), randomPoint(), randomPoint() );
			var t : Vector.<Point3d> = new Vector.<Point3d>();
			t.push( m.transformPoint( v[0] ), m.transformPoint( v[1] ), m.transformPoint( v[2] ) );
			var r : Vector.<Point3d> = m.transformPoints( v );
			Assert.assertTrue( "Points transform first Point3D", r[0].equals( t[0] ) );
			Assert.assertTrue( "Points transform second Point3D", r[1].equals( t[1] ) );
			Assert.assertTrue( "Points transform third Point3D", r[2].equals( t[2] ) );
		}

		[Test]
		public function transformPointsInto() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Point3d> = new Vector.<Point3d>();
			v.push( randomPoint(), randomPoint(), randomPoint() );
			var t : Vector.<Point3d> = new Vector.<Point3d>();
			t.push( m.transformPoint( v[0] ), m.transformPoint( v[1] ), m.transformPoint( v[2] ) );
			var r : Vector.<Point3d> = new Vector.<Point3d>();
			r.push(  new Point3d(),  new Point3d(),  new Point3d() );
			m.transformPoints( v, r );
			Assert.assertTrue( "Points transform into first Point3D", r[0].equals( t[0] ) );
			Assert.assertTrue( "Points transform into second Point3D", r[1].equals( t[1] ) );
			Assert.assertTrue( "Points transform into third Point3D", r[2].equals( t[2] ) );
		}

		[Test]
		public function transformPointsSelf() : void
		{
			var m : Matrix3d = randomMatrix();
			var v : Vector.<Point3d> = new Vector.<Point3d>();
			v.push( randomPoint(), randomPoint(), randomPoint() );
			var t : Vector.<Point3d> = new Vector.<Point3d>();
			t.push( m.transformPoint( v[0] ), m.transformPoint( v[1] ), m.transformPoint( v[2] ) );
			var r : Vector.<Point3d> = m.transformPointsSelf( v );
			Assert.assertTrue( "Points transform first Point3D", v[0].equals( t[0] ) );
			Assert.assertTrue( "Points transform second Point3D", v[1].equals( t[1] ) );
			Assert.assertTrue( "Points transform third Point3D", v[2].equals( t[2] ) );
			Assert.assertEquals( "TransformPointsSelf returns the result", v, r );
		}

		[Test]
		public function getPosition() : void
		{
			var m : Matrix3d = randomMatrix();
			var p : Point3d = m.position;
			Assert.assertEquals( "Position x get correct", p.x, m.n14 );
			Assert.assertEquals( "Position y get correct", p.y, m.n24 );
			Assert.assertEquals( "Position z get correct", p.z, m.n34 );
			Assert.assertEquals( "Position w get correct", p.w, m.n44 );
		}

		[Test]
		public function setPosition() : void
		{
			var m : Matrix3d = randomMatrix();
			var p : Point3d = randomPoint();
			m.position = p;
			Assert.assertEquals( "Position x set correct", p.x, m.n14 );
			Assert.assertEquals( "Position y set correct", p.y, m.n24 );
			Assert.assertEquals( "Position z set correct", p.z, m.n34 );
			Assert.assertEquals( "Position w set correct", p.w, m.n44 );
		}

		[Test]
		public function getRawData16() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 16 );
			var matrix : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			var rawData : Vector.<Number> = matrix.rawData;
			for( var i:uint = 0; i < 16; ++i )
			{
				Assert.assertEquals( "Get raw data item " + i + " correct", rawData[i], a[i] );
			}
		}

		[Test]
		public function setRawData12() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 12 );
			var matrix : Matrix3d = randomMatrix();
			matrix.rawData = a;
			var correct : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11] );
			Assert.assertTrue( "Set raw data with 12 parameters", matrix.equals( correct ) );
		}

		[Test]
		public function setRawData16() : void
		{
			var a : Vector.<Number> = randomVectorNumber( 16 );
			var matrix : Matrix3d = randomMatrix();
			matrix.rawData = a;
			var correct : Matrix3d = new Matrix3d( a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14], a[15] );
			Assert.assertTrue( "Set raw data with 16 parameters", matrix.equals( correct ) );
		}

		private function randomNumber() : Number
		{
			return Math.random() * 200 - 100;
		}

		private function randomVector() : Vector3d
		{
			return new Vector3d( randomNumber(), randomNumber(), randomNumber() );
		}

		private function randomPoint() : Point3d
		{
			return new Point3d( randomNumber(), randomNumber(), randomNumber() );
		}

		private function randomMatrix() : Matrix3d
		{
			return new Matrix3d(
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber(),
				randomNumber(), randomNumber(), randomNumber(), randomNumber()
			);
		}
		
		private function randomVectorNumber( length : uint ) : Vector.<Number>
		{
			var vector : Vector.<Number> = new Vector.<Number>();
			while ( length-- > 0 )
			{
				vector.push( randomNumber() );
			}
			return vector;
		}
	}
}
