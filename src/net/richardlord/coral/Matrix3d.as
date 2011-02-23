/*
 * Author: Richard Lord
 * Copyright (c) Richard Lord 2008-2011
 * http://www.richardlord.net/
 * 
 * Licence Agreement
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */
package net.richardlord.coral
{
	use namespace coral_internal;
	/**
	 * Matrix3d represents a 3d transformation matrix.
	 */
	public class Matrix3d
	{
		/**
		 * A zero matrix.
		 */
		public static function get ZERO() : Matrix3d
		{
			return new Matrix3d( 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 );
		}

		/**
		 * An identity matrix.
		 */
		public static function get IDENTITY() : Matrix3d
		{
			return new Matrix3d();
		}

		/**
		 * Creates a new Matrix3d for scaling.
		 * 
		 * @param scaleX The scale factor in the x direction
		 * @param scaleY The scale factor in the y direction
		 * @param scaleZ The scale factor in the z direction
		 * 
		 * @return The new matrix
		 */
		public static function newScale( scaleX : Number, scaleY : Number, scaleZ : Number ) : Matrix3d
		{
			return new Matrix3d( scaleX, 0, 0, 0, 0, scaleY, 0, 0, 0, 0, scaleZ, 0, 0, 0, 0, 1 );
		}

		/**
		 * Creates a new Matrix3d for translation.
		 * 
		 * @param x The translation along the x axis.
		 * @param y The translation along the y axis.
		 * @param z The translation along the z axis.
		 * 
		 * @return The new matrix
		 */
		public static function newTranslation( x : Number, y : Number, z : Number ) : Matrix3d
		{
			return new Matrix3d( 1, 0, 0, x, 0, 1, 0, y, 0, 0, 1, z, 0, 0, 0, 1 );
		}

		/**
		 * Creates a new Matrix3d for rotation about an axis.
		 * 
		 * @param angle The angle in radians for the rotation
		 * @param axis The axis to rotation around
		 * @param pivotPoint The point the axis passes through. The default value is the origin.
		 * 
		 * @return The new matrix
		 */
		public static function newRotation( angle : Number, axis : Vector3d, pivotPoint : Point3d = null ) : Matrix3d
		{
			if ( angle == 0 )
			{
				return new Matrix3d();
			}
			var ax : Number;
			var ay : Number;
			var az : Number;
			var lenSq : Number = axis.lengthSquared;
			if( Math.abs( lenSq - 1 ) < 0.00001 ) 
			{
				ax = axis.x;
				ay = axis.y;
				az = axis.z;
			}
			else
			{
				var factor : Number = 1 / Math.sqrt( lenSq );
				ax = axis.x * factor;
				ay = axis.y * factor;
				az = axis.z * factor;
			}

			const sin : Number = Math.sin( angle );
			const cos : Number = Math.cos( angle );
			const oneMinCos : Number = 1 - cos;
			
			var m:Matrix3d = new Matrix3d();
			
			m.n11 = cos + ax * ax * oneMinCos;
			m.n12 = ax * ay * oneMinCos - az * sin;
			m.n13 = ax * az * oneMinCos + ay * sin;
			m.n21 = ax * ay * oneMinCos + az * sin;
			m.n22 = cos + ay * ay * oneMinCos;
			m.n23 = ay * az * oneMinCos - ax * sin;
			m.n31 = ax * az * oneMinCos - ay * sin;
			m.n32 = ay * az * oneMinCos + ax * sin;
			m.n33 = cos + az * az * oneMinCos;
			
			if( pivotPoint )
			{
				m.n14 = - pivotPoint.x * ( m.n11 - 1 ) - pivotPoint.y * m.n12 - pivotPoint.z * m.n13;
				m.n24 = - pivotPoint.x * m.n21 - pivotPoint.y * ( m.n22 - 1 ) - pivotPoint.z * m.n23;
				m.n34 = - pivotPoint.x * m.n31 - pivotPoint.y * m.n32 - pivotPoint.z * ( m.n33 - 1 );
			}
			return m;
		}

		/**
		 * Creates a coordinate system transformation such that the vectors
		 * indicated are transformed to the x, y and z axes. The vectors need
		 * not be perpendicular, but they must form a basis for 3d space.
		 * 
		 * @param axisX The vector that is translated to ( 1, 0, 0 ) by the transform.
		 * @param axisY The vector that is translated to ( 0, 1, 0 ) by the transform.
		 * @param axisZ The vector that is translated to ( 0, 0, 1 ) by the transform.
		 */
		public static function newBasisTransform( axisX : Vector3d, axisY : Vector3d, axisZ : Vector3d ) : Matrix3d
		{
			var p11 : Number = axisX.x;
			var p12 : Number = axisY.x;
			var p13 : Number = axisZ.x;
			var p21 : Number = axisX.y;
			var p22 : Number = axisY.y;
			var p23 : Number = axisZ.y;
			var p31 : Number = axisX.z;
			var p32 : Number = axisY.z;
			var p33 : Number = axisZ.z;
			
			var d:Number = ( p11 * p22 - p12 * p21 ) * p33 + ( p13 * p21 - p11 * p23 ) * p32 + ( p12 * p23 - p13 * p22 ) * p31;
			if ( Math.abs( d ) < 0.000001 )
			{
				return null;
			}
			const det : Number = 1 / d;

			var m : Matrix3d = new Matrix3d();
			m.n11 = det * ( p22 * p33 - p32 * p23 );
			m.n12 = det * ( p32 * p13 - p12 * p33 );
			m.n13 = det * ( p12 * p23 - p22 * p13 );
			m.n21 = det * ( p31 * p23 - p21 * p33 );
			m.n22 = det * ( p11 * p33 - p31 * p13 );
			m.n23 = det * ( p21 * p13 - p11 * p23 );
			m.n31 = det * ( p21 * p32 - p31 * p22 );
			m.n32 = det * ( p31 * p12 - p11 * p32 );
			m.n33 = det * ( p11 * p22 - p21 * p12 );
	
			return m;
		}

		/**
		 * The value in row 1 column 1 of the matrix.
		 * 
		 * x 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n11 : Number = 1;
		/**
		 * The value in row 1 column 2 of the matrix.
		 * 
		 * 0 x 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n12 : Number = 0;
		/**
		 * The value in row 1 column 3 of the matrix.
		 * 
		 * 0 0 x 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n13 : Number = 0;
		/**
		 * The value in row 1 column 4 of the matrix.
		 * 
		 * 0 0 0 x
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n14 : Number = 0;
		/**
		 * The value in row 2 column 1 of the matrix.
		 * 
		 * 0 0 0 0
		 * x 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n21 : Number = 0;
		/**
		 * The value in row 2 column 2 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 x 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n22 : Number = 1;
		/**
		 * The value in row 2 column 3 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 x 0
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n23 : Number = 0;
		/**
		 * The value in row 2 column 4 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 x
		 * 0 0 0 0
		 * 0 0 0 0
		 */
		public var n24 : Number = 0;
		/**
		 * The value in row 3 column 1 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * x 0 0 0
		 * 0 0 0 0
		 */
		public var n31 : Number = 0;
		/**
		 * The value in row 3 column 2 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 x 0 0
		 * 0 0 0 0
		 */
		public var n32 : Number = 0;
		/**
		 * The value in row 3 column 3 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 x 0
		 * 0 0 0 0
		 */
		public var n33 : Number = 1;
		/**
		 * The value in row 3 column 4 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 x
		 * 0 0 0 0
		 */
		public var n34 : Number = 0;
		/**
		 * The value in row 4 column 1 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * x 0 0 0
		 */
		public var n41 : Number = 0;
		/**
		 * The value in row 4 column 2 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 x 0 0
		 */
		public var n42 : Number = 0;
		/**
		 * The value in row 4 column 3 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 x 0
		 */
		public var n43 : Number = 0;
		/**
		 * The value in row 4 column 4 of the matrix.
		 * 
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 0
		 * 0 0 0 x
		 */
		public var n44 : Number = 1;

		/**
		 * Creates a Matrix3d object from a list of numbers.
		 * 
		 * @param p11 The value in row 1 column 1 of the matrix.
		 * @param p12 The value in row 1 column 2 of the matrix.
		 * @param p13 The value in row 1 column 3 of the matrix.
		 * @param p14 The value in row 1 column 4 of the matrix.
		 * @param p21 The value in row 2 column 1 of the matrix.
		 * @param p22 The value in row 2 column 2 of the matrix.
		 * @param p23 The value in row 2 column 3 of the matrix.
		 * @param p24 The value in row 2 column 4 of the matrix.
		 * @param p31 The value in row 3 column 1 of the matrix.
		 * @param p32 The value in row 3 column 2 of the matrix.
		 * @param p33 The value in row 3 column 3 of the matrix.
		 * @param p34 The value in row 3 column 4 of the matrix.
		 * @param p41 The value in row 4 column 1 of the matrix.
		 * @param p42 The value in row 4 column 2 of the matrix.
		 * @param p43 The value in row 4 column 3 of the matrix.
		 * @param p44 The value in row 4 column 4 of the matrix.
		 */
		public function Matrix3d(
			p11 : Number = 1, p12 : Number = 0, p13 : Number = 0, p14 : Number = 0,
			p21 : Number = 0, p22 : Number = 1, p23 : Number = 0, p24 : Number = 0,
			p31 : Number = 0, p32 : Number = 0, p33 : Number = 1, p34 : Number = 0,
			p41 : Number = 0, p42 : Number = 0, p43 : Number = 0, p44 : Number = 1 )
		{
			n11 = p11;
			n12 = p12;
			n13 = p13;
			n14 = p14;
			n21 = p21;
			n22 = p22;
			n23 = p23;
			n24 = p24;
			n31 = p31;
			n32 = p32;
			n33 = p33;
			n34 = p34;
			n41 = p41;
			n42 = p42;
			n43 = p43;
			n44 = p44;
		}

		/**
		 * Reset the matrix
		 * 
		 * @param p11 The value in row 1 column 1 of the matrix.
		 * @param p12 The value in row 1 column 2 of the matrix.
		 * @param p13 The value in row 1 column 3 of the matrix.
		 * @param p14 The value in row 1 column 4 of the matrix.
		 * @param p21 The value in row 2 column 1 of the matrix.
		 * @param p22 The value in row 2 column 2 of the matrix.
		 * @param p23 The value in row 2 column 3 of the matrix.
		 * @param p24 The value in row 2 column 4 of the matrix.
		 * @param p31 The value in row 3 column 1 of the matrix.
		 * @param p32 The value in row 3 column 2 of the matrix.
		 * @param p33 The value in row 3 column 3 of the matrix.
		 * @param p34 The value in row 3 column 4 of the matrix.
		 * @param p41 The value in row 4 column 1 of the matrix.
		 * @param p42 The value in row 4 column 2 of the matrix.
		 * @param p43 The value in row 4 column 3 of the matrix.
		 * @param p44 The value in row 4 column 4 of the matrix.
		 * 
		 * @return a reference to this matrix.
		 */
		public function reset (
			p11 : Number = 1, p12 : Number = 0, p13 : Number = 0, p14 : Number = 0,
			p21 : Number = 0, p22 : Number = 1, p23 : Number = 0, p24 : Number = 0,
			p31 : Number = 0, p32 : Number = 0, p33 : Number = 1, p34 : Number = 0,
			p41 : Number = 0, p42 : Number = 0, p43 : Number = 0, p44 : Number = 1 ) : Matrix3d
		{
			n11 = p11;
			n12 = p12;
			n13 = p13;
			n14 = p14;
			n21 = p21;
			n22 = p22;
			n23 = p23;
			n24 = p24;
			n31 = p31;
			n32 = p32;
			n33 = p33;
			n34 = p34;
			n41 = p41;
			n42 = p42;
			n43 = p43;
			n44 = p44;
			return this;
		}


		/**
		 * Copy another matrix into this one
		 * 
		 * @param m the matrix to copy
		 * 
		 * @return a reference to this matrix
		 */
		public function assign( m : Matrix3d ) : Matrix3d
		{
			n11 = m.n11;
			n12 = m.n12;
			n13 = m.n13;
			n14 = m.n14;
			n21 = m.n21;
			n22 = m.n22;
			n23 = m.n23;
			n24 = m.n24;
			n31 = m.n31;
			n32 = m.n32;
			n33 = m.n33;
			n34 = m.n34;
			n41 = m.n41;
			n42 = m.n42;
			n43 = m.n43;
			n44 = m.n44;
			return this;
		}

		/**
		 * Make a duplicate of this matrix
		 * 
		 * @return The new matrix
		 */
		public function clone() : Matrix3d
		{
			return new Matrix3d( n11, n12, n13, n14, n21, n22, n23, n24, n31, n32, n33, n34, n41, n42, n43, n44 );
		}

		/**
		 * Compare another matrix with this one
		 * 
		 * @param m the matrix to compare with
		 * 
		 * @return true if the matrices are the same, false otherwise
		 */
		public function equals( m : Matrix3d ) : Boolean
		{
			return m.n11 == n11 && m.n12 == n12 && m.n13 == n13 && m.n14 == n14 && m.n21 == n21 && m.n22 == n22 && m.n23 == n23 && m.n24 == n24 && m.n31 == n31 && m.n32 == n32 && m.n33 == n33 && m.n34 == n34 && m.n41 == n41 && m.n42 == n42 && m.n43 == n43 && m.n44 == n44;
		}

		/**
		 * Compare another matrix with this one
		 * 
		 * @param m the matrix to compare with
		 * @param e The small variation allowed between the values representing
		 * the matrices
		 * 
		 * @return true if the matrices are the within e of each other, false otherwise
		 */
		public function nearEquals( m : Matrix3d, e : Number ) : Boolean
		{
			return Math.abs( m.n11 - n11 ) <= e && Math.abs( m.n12 - n12 ) <= e && Math.abs( m.n13 - n13 ) <= e && Math.abs( m.n14 - n14 ) <= e && Math.abs( m.n21 - n21 ) <= e && Math.abs( m.n22 - n22 ) <= e && Math.abs( m.n23 - n23 ) <= e && Math.abs( m.n24 - n24 ) <= e && Math.abs( m.n31 - n31 ) <= e && Math.abs( m.n32 - n32 ) <= e && Math.abs( m.n33 - n33 ) <= e && Math.abs( m.n34 - n34 ) <= e && Math.abs( m.n41 - n41 ) <= e && Math.abs( m.n42 - n42 ) <= e && Math.abs( m.n43 - n43 ) <= e && Math.abs( m.n44 - n44 ) <= e;
		}

		/**
		 * Add another transformation matrix to this one, applying the new
		 * transformation after the transformations already in this matrix.
		 * 
		 * @param m The other transformation matrix
		 * 
		 * @return A reference to this matrix
		 */
		public function append( m : Matrix3d ) : Matrix3d
		{
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			n11 = m.n11 * o11 + m.n12 * o21 + m.n13 * o31 + m.n14 * o41;
			n12 = m.n11 * o12 + m.n12 * o22 + m.n13 * o32 + m.n14 * o42;
			n13 = m.n11 * o13 + m.n12 * o23 + m.n13 * o33 + m.n14 * o43;
			n14 = m.n11 * o14 + m.n12 * o24 + m.n13 * o34 + m.n14 * o44;
			n21 = m.n21 * o11 + m.n22 * o21 + m.n23 * o31 + m.n24 * o41;
			n22 = m.n21 * o12 + m.n22 * o22 + m.n23 * o32 + m.n24 * o42;
			n23 = m.n21 * o13 + m.n22 * o23 + m.n23 * o33 + m.n24 * o43;
			n24 = m.n21 * o14 + m.n22 * o24 + m.n23 * o34 + m.n24 * o44;
			n31 = m.n31 * o11 + m.n32 * o21 + m.n33 * o31 + m.n34 * o41;
			n32 = m.n31 * o12 + m.n32 * o22 + m.n33 * o32 + m.n34 * o42;
			n33 = m.n31 * o13 + m.n32 * o23 + m.n33 * o33 + m.n34 * o43;
			n34 = m.n31 * o14 + m.n32 * o24 + m.n33 * o34 + m.n34 * o44;
			n41 = m.n41 * o11 + m.n42 * o21 + m.n43 * o31 + m.n44 * o41;
			n42 = m.n41 * o12 + m.n42 * o22 + m.n43 * o32 + m.n44 * o42;
			n43 = m.n41 * o13 + m.n42 * o23 + m.n43 * o33 + m.n44 * o43;
			n44 = m.n41 * o14 + m.n42 * o24 + m.n43 * o34 + m.n44 * o44;

			return this;
		}

		/**
		 * Append a scale transformation to this matrix, applying the scale
		 * after the transformations already in this matrix.
		 * 
		 * @param scaleX The scaling factor in the x direction
		 * @param scaleY The scaling factor in the y direction
		 * @param scaleZ The scaling factor in the z direction
		 * 
		 * @return A reference to this matrix
		 */
		public function appendScale( scaleX : Number, scaleY : Number, scaleZ : Number ) : Matrix3d
		{
			n11 *= scaleX;
			n12 *= scaleX;
			n13 *= scaleX;
			n14 *= scaleX;
			n21 *= scaleY;
			n22 *= scaleY;
			n23 *= scaleY;
			n24 *= scaleY;
			n31 *= scaleZ;
			n32 *= scaleZ;
			n33 *= scaleZ;
			n34 *= scaleZ;

			return this;
		}

		/**
		 * Append a translation transformation to this matrix, applying the 
		 * translation after the transformations already in this matrix.
		 * 
		 * @param x The translation along the x axis.
		 * @param y The translation along the y axis.
		 * @param z The translation along the z axis.
		 * 
		 * @return A reference to this matrix
		 */
		public function appendTranslation( x : Number, y : Number, z : Number ) : Matrix3d
		{
			n11 += x * n41;
			n12 += x * n42;
			n13 += x * n43;
			n14 += x * n44;
			n21 += y * n41;
			n22 += y * n42;
			n23 += y * n43;
			n24 += y * n44;
			n31 += z * n41;
			n32 += z * n42;
			n33 += z * n43;
			n34 += z * n44;

			return this;
		}

		/**
		 * Append a rotation transformation to this matrix, applying the 
		 * rotation after the transformations already in this matrix.
		 * 
		 * @param angle The rotation angle in radians.
		 * @param axis The vector to rotation around
		 * @param pivotPoint The point the axis passes through. The default value is the origin.
		 * 
		 * @return A reference to this matrix
		 */
		public function appendRotation( angle : Number, axis : Vector3d, pivotPoint : Point3d = null ) : Matrix3d
		{
			if ( angle == 0 )
			{
				return this;
			}

			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			var ax : Number;
			var ay : Number;
			var az : Number;
			var lenSq : Number = axis.lengthSquared;
			if( Math.abs( lenSq - 1 ) < 0.00001 ) 
			{
				ax = axis.x;
				ay = axis.y;
				az = axis.z;
			}
			else
			{
				var factor : Number = 1 / Math.sqrt( lenSq );
				ax = axis.x * factor;
				ay = axis.y * factor;
				az = axis.z * factor;
			}

			const sin : Number = Math.sin( angle );
			const cos : Number = Math.cos( angle );
			const oneMinCos : Number = 1 - cos;
			
			var p11 : Number = cos + ax * ax * oneMinCos;
			var p12 : Number = ax * ay * oneMinCos - az * sin;
			var p13 : Number = ax * az * oneMinCos + ay * sin;
			var p14 : Number = 0;
			var p21 : Number = ax * ay * oneMinCos + az * sin;
			var p22 : Number = cos + ay * ay * oneMinCos;
			var p23 : Number = ay * az * oneMinCos - ax * sin;
			var p24 : Number = 0;
			var p31 : Number = ax * az * oneMinCos - ay * sin;
			var p32 : Number = ay * az * oneMinCos + ax * sin;
			var p33 : Number = cos + az * az * oneMinCos;
			var p34 : Number = 0;
			
			if( pivotPoint )
			{
				p14 = - pivotPoint.x * ( p11 - 1 ) - pivotPoint.y * p12 - pivotPoint.z * p13;
				p24 = - pivotPoint.x * p21 - pivotPoint.y * ( p22 - 1 ) - pivotPoint.z * p23;
				p34 = - pivotPoint.x * p31 - pivotPoint.y * p32 - pivotPoint.z * ( p33 - 1 );
			}

			n11 = p11 * o11 + p12 * o21 + p13 * o31 + p14 * o41;
			n12 = p11 * o12 + p12 * o22 + p13 * o32 + p14 * o42;
			n13 = p11 * o13 + p12 * o23 + p13 * o33 + p14 * o43;
			n14 = p11 * o14 + p12 * o24 + p13 * o34 + p14 * o44;
			n21 = p21 * o11 + p22 * o21 + p23 * o31 + p24 * o41;
			n22 = p21 * o12 + p22 * o22 + p23 * o32 + p24 * o42;
			n23 = p21 * o13 + p22 * o23 + p23 * o33 + p24 * o43;
			n24 = p21 * o14 + p22 * o24 + p23 * o34 + p24 * o44;
			n31 = p31 * o11 + p32 * o21 + p33 * o31 + p34 * o41;
			n32 = p31 * o12 + p32 * o22 + p33 * o32 + p34 * o42;
			n33 = p31 * o13 + p32 * o23 + p33 * o33 + p34 * o43;
			n34 = p31 * o14 + p32 * o24 + p33 * o34 + p34 * o44;

			return this;
		}

		/**
		 * Append a coordinate system transformation such that the vectors
		 * indicated are transformed to the x, y and z axes. The vectors need
		 * not be perpendicular, but they must form a basis for 3d space.
		 * 
		 * @param axisX The vector that is translated to ( 1, 0, 0 ) by the transform.
		 * @param axisY The vector that is translated to ( 0, 1, 0 ) by the transform.
		 * @param axisZ The vector that is translated to ( 0, 0, 1 ) by the transform.
		 * 
		 * @return A reference to this matrix
		 */
		public function appendBasisTransform( axisX : Vector3d, axisY : Vector3d, axisZ : Vector3d ) : Matrix3d
		{
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;

			var p11 : Number = axisX.x;
			var p12 : Number = axisY.x;
			var p13 : Number = axisZ.x;
			var p21 : Number = axisX.y;
			var p22 : Number = axisY.y;
			var p23 : Number = axisZ.y;
			var p31 : Number = axisX.z;
			var p32 : Number = axisY.z;
			var p33 : Number = axisZ.z;
			
			var d:Number = ( p11 * p22 - p12 * p21 ) * p33 + ( p13 * p21 - p11 * p23 ) * p32 + ( p12 * p23 - p13 * p22 ) * p31;
			if ( Math.abs( d ) < 0.000001 )
			{
				n11 = n12 = n13 = n14 = n21 = n22 = n23 = n24 = n31 = n32 = n33 = n34 = n41 = n42 = n43 = n44 = NaN;
				return null;
			}
			const det : Number = 1 / d;

			var q11 : Number = det * ( p22 * p33 - p32 * p23 );
			var q12 : Number = det * ( p32 * p13 - p12 * p33 );
			var q13 : Number = det * ( p12 * p23 - p22 * p13 );
			var q21 : Number = det * ( p31 * p23 - p21 * p33 );
			var q22 : Number = det * ( p11 * p33 - p31 * p13 );
			var q23 : Number = det * ( p21 * p13 - p11 * p23 );
			var q31 : Number = det * ( p21 * p32 - p31 * p22 );
			var q32 : Number = det * ( p31 * p12 - p11 * p32 );
			var q33 : Number = det * ( p11 * p22 - p21 * p12 );
			
			n11 = q11 * o11 + q12 * o21 + q13 * o31;
			n12 = q11 * o12 + q12 * o22 + q13 * o32;
			n13 = q11 * o13 + q12 * o23 + q13 * o33;
			n14 = q11 * o14 + q12 * o24 + q13 * o34;
			n21 = q21 * o11 + q22 * o21 + q23 * o31;
			n22 = q21 * o12 + q22 * o22 + q23 * o32;
			n23 = q21 * o13 + q22 * o23 + q23 * o33;
			n24 = q21 * o14 + q22 * o24 + q23 * o34;
			n31 = q31 * o11 + q32 * o21 + q33 * o31;
			n32 = q31 * o12 + q32 * o22 + q33 * o32;
			n33 = q31 * o13 + q32 * o23 + q33 * o33;
			n34 = q31 * o14 + q32 * o24 + q33 * o34;

			return this;
		}

		/**
		 * Add another transformation matrix to this one, applying the new
		 * transformation before the transformations already in this matrix.
		 * 
		 * @param m The other transformation matrix
		 * 
		 * @return A reference to this matrix
		 */
		public function prepend( m : Matrix3d ) : Matrix3d
		{
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			n11 = o11 * m.n11 + o12 * m.n21 + o13 * m.n31 + o14 * m.n41;
			n12 = o11 * m.n12 + o12 * m.n22 + o13 * m.n32 + o14 * m.n42;
			n13 = o11 * m.n13 + o12 * m.n23 + o13 * m.n33 + o14 * m.n43;
			n14 = o11 * m.n14 + o12 * m.n24 + o13 * m.n34 + o14 * m.n44;
			n21 = o21 * m.n11 + o22 * m.n21 + o23 * m.n31 + o24 * m.n41;
			n22 = o21 * m.n12 + o22 * m.n22 + o23 * m.n32 + o24 * m.n42;
			n23 = o21 * m.n13 + o22 * m.n23 + o23 * m.n33 + o24 * m.n43;
			n24 = o21 * m.n14 + o22 * m.n24 + o23 * m.n34 + o24 * m.n44;
			n31 = o31 * m.n11 + o32 * m.n21 + o33 * m.n31 + o34 * m.n41;
			n32 = o31 * m.n12 + o32 * m.n22 + o33 * m.n32 + o34 * m.n42;
			n33 = o31 * m.n13 + o32 * m.n23 + o33 * m.n33 + o34 * m.n43;
			n34 = o31 * m.n14 + o32 * m.n24 + o33 * m.n34 + o34 * m.n44;
			n41 = o41 * m.n11 + o42 * m.n21 + o43 * m.n31 + o44 * m.n41;
			n42 = o41 * m.n12 + o42 * m.n22 + o43 * m.n32 + o44 * m.n42;
			n43 = o41 * m.n13 + o42 * m.n23 + o43 * m.n33 + o44 * m.n43;
			n44 = o41 * m.n14 + o42 * m.n24 + o43 * m.n34 + o44 * m.n44;

			return this;
		}

		/**
		 * Prepend a scale transformation to this matrix, applying the scale
		 * before the transformations already in this matrix.
		 * 
		 * @param scaleX The scaling factor in the x direction
		 * @param scaleY The scaling factor in the y direction
		 * @param scaleZ The scaling factor in the z direction
		 * 
		 * @return A reference to this matrix
		 */
		public function prependScale( scaleX : Number, scaleY : Number, scaleZ : Number ) : Matrix3d
		{
			n11 *= scaleX;
			n12 *= scaleY;
			n13 *= scaleZ;
			n21 *= scaleX;
			n22 *= scaleY;
			n23 *= scaleZ;
			n31 *= scaleX;
			n32 *= scaleY;
			n33 *= scaleZ;
			n41 *= scaleX;
			n42 *= scaleY;
			n43 *= scaleZ;

			return this;
		}

		/**
		 * Prepend a translation transformation to this matrix, applying the 
		 * translation before the transformations already in this matrix.
		 * 
		 * @param x The translation along the x axis.
		 * @param y The translation along the y axis.
		 * @param z The translation along the z axis.
		 * 
		 * @return A reference to this matrix
		 */
		public function prependTranslation( x : Number, y : Number, z : Number ) : Matrix3d
		{
			n14 += x * n11 + y * n12 + z * n13;
			n24 += x * n21 + y * n22 + z * n23;
			n34 += x * n31 + y * n32 + z * n33;
			n44 += x * n41 + y * n42 + z * n43;

			return this;
		}

		/**
		 * Prepend a rotation about an axis transformation to this matrix, applying the 
		 * rotation before the transformations already in this matrix.
		 * 
		 * @param angle The rotation angle in radians.
		 * @param axis The vector to rotation around
		 * @param pivotPoint The point the axis passes through. The default value is the origin.
		 * 
		 * @return A reference to this matrix
		 */
		public function prependRotation( angle : Number, axis : Vector3d, pivotPoint : Point3d = null ) : Matrix3d
		{
			if ( angle == 0 )
			{
				return this;
			}

			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			var ax : Number;
			var ay : Number;
			var az : Number;
			var lenSq : Number = axis.lengthSquared;
			if( Math.abs( lenSq - 1 ) < 0.00001 ) 
			{
				ax = axis.x;
				ay = axis.y;
				az = axis.z;
			}
			else
			{
				var factor : Number = 1 / Math.sqrt( lenSq );
				ax = axis.x * factor;
				ay = axis.y * factor;
				az = axis.z * factor;
			}

			const sin : Number = Math.sin( angle );
			const cos : Number = Math.cos( angle );
			const oneMinCos : Number = 1 - cos;
			
			var p11 : Number = cos + ax * ax * oneMinCos;
			var p12 : Number = ax * ay * oneMinCos - az * sin;
			var p13 : Number = ax * az * oneMinCos + ay * sin;
			var p14 : Number = 0;
			var p21 : Number = ax * ay * oneMinCos + az * sin;
			var p22 : Number = cos + ay * ay * oneMinCos;
			var p23 : Number = ay * az * oneMinCos - ax * sin;
			var p24 : Number = 0;
			var p31 : Number = ax * az * oneMinCos - ay * sin;
			var p32 : Number = ay * az * oneMinCos + ax * sin;
			var p33 : Number = cos + az * az * oneMinCos;
			var p34 : Number = 0;
			
			if( pivotPoint )
			{
				p14 = - pivotPoint.x * ( p11 - 1 ) - pivotPoint.y * p12 - pivotPoint.z * p13;
				p24 = - pivotPoint.x * p21 - pivotPoint.y * ( p22 - 1 ) - pivotPoint.z * p23;
				p34 = - pivotPoint.x * p31 - pivotPoint.y * p32 - pivotPoint.z * ( p33 - 1 );
			}

			n11 = o11 * p11 + o12 * p21 + o13 * p31;
			n12 = o11 * p12 + o12 * p22 + o13 * p32;
			n13 = o11 * p13 + o12 * p23 + o13 * p33;
			n14 = o11 * p14 + o12 * p24 + o13 * p34 + o14;
			n21 = o21 * p11 + o22 * p21 + o23 * p31;
			n22 = o21 * p12 + o22 * p22 + o23 * p32;
			n23 = o21 * p13 + o22 * p23 + o23 * p33;
			n24 = o21 * p14 + o22 * p24 + o23 * p34 + o24;
			n31 = o31 * p11 + o32 * p21 + o33 * p31;
			n32 = o31 * p12 + o32 * p22 + o33 * p32;
			n33 = o31 * p13 + o32 * p23 + o33 * p33;
			n34 = o31 * p14 + o32 * p24 + o33 * p34 + o34;
			n41 = o41 * p11 + o42 * p21 + o43 * p31;
			n42 = o41 * p12 + o42 * p22 + o43 * p32;
			n43 = o41 * p13 + o42 * p23 + o43 * p33;
			n44 = o41 * p14 + o42 * p24 + o43 * p34 + o44;

			return this;
		}

		/**
		 * Prepend a coordinate system transformation such that the vectors
		 * indicated are transformed to the x, y and z axes. The vectors need
		 * not be perpendicular, but they must form a basis for 3d space.
		 * 
		 * @param axisX The vector that is translated to ( 1, 0, 0 ) by the transform.
		 * @param axisY The vector that is translated to ( 0, 1, 0 ) by the transform.
		 * @param axisZ The vector that is translated to ( 0, 0, 1 ) by the transform.
		 * 
		 * @return A reference to this matrix
		 */
		public function prependBasisTransform( axisX : Vector3d, axisY : Vector3d, axisZ : Vector3d ) : Matrix3d
		{
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;

			var p11 : Number = axisX.x;
			var p12 : Number = axisY.x;
			var p13 : Number = axisZ.x;
			var p21 : Number = axisX.y;
			var p22 : Number = axisY.y;
			var p23 : Number = axisZ.y;
			var p31 : Number = axisX.z;
			var p32 : Number = axisY.z;
			var p33 : Number = axisZ.z;
			
			var d:Number = ( p11 * p22 - p12 * p21 ) * p33 + ( p13 * p21 - p11 * p23 ) * p32 + ( p12 * p23 - p13 * p22 ) * p31;
			if ( Math.abs( d ) < 0.000001 )
			{
				n11 = n12 = n13 = n14 = n21 = n22 = n23 = n24 = n31 = n32 = n33 = n34 = n41 = n42 = n43 = n44 = NaN;
				return null;
			}
			const det : Number = 1 / d;

			var q11 : Number = det * ( p22 * p33 - p32 * p23 );
			var q12 : Number = det * ( p32 * p13 - p12 * p33 );
			var q13 : Number = det * ( p12 * p23 - p22 * p13 );
			var q21 : Number = det * ( p31 * p23 - p21 * p33 );
			var q22 : Number = det * ( p11 * p33 - p31 * p13 );
			var q23 : Number = det * ( p21 * p13 - p11 * p23 );
			var q31 : Number = det * ( p21 * p32 - p31 * p22 );
			var q32 : Number = det * ( p31 * p12 - p11 * p32 );
			var q33 : Number = det * ( p11 * p22 - p21 * p12 );
			
			n11 = o11 * q11 + o12 * q21 + o13 * q31;
			n12 = o11 * q12 + o12 * q22 + o13 * q32;
			n13 = o11 * q13 + o12 * q23 + o13 * q33;
			n21 = o21 * q11 + o22 * q21 + o23 * q31;
			n22 = o21 * q12 + o22 * q22 + o23 * q32;
			n23 = o21 * q13 + o22 * q23 + o23 * q33;
			n31 = o31 * q11 + o32 * q21 + o33 * q31;
			n32 = o31 * q12 + o32 * q22 + o33 * q32;
			n33 = o31 * q13 + o32 * q23 + o33 * q33;
			n41 = o41 * q11 + o42 * q21 + o43 * q31;
			n42 = o41 * q12 + o42 * q22 + o43 * q32;
			n43 = o41 * q13 + o42 * q23 + o43 * q33;

			return this;
		}

		/**
		 * The determinant of the matrix
		 */
		public function get determinant() : Number
		{
			return ( n11 * n22 - n12 * n21 ) * ( n33 * n44 - n34 * n43 ) + ( n13 * n21 - n11 * n23 ) * ( n32 * n44 - n34 * n42 ) + ( n11 * n24 - n14 * n21 ) * ( n32 * n43 - n33 * n42 ) + ( n12 * n23 - n13 * n22 ) * ( n31 * n44 - n34 * n41 ) + ( n14 * n22 - n12 * n24 ) * ( n31 * n43 - n33 * n41 ) + ( n13 * n24 - n14 * n23 ) * ( n31 * n42 - n32 * n41 );
		}

		/**
		 * The inverse of this matrix, or null if no inverse exists
		 * 
		 * @param result The matrix to hold the result of the inversion. If
		 * no matrix is passed, a new matrix is created.
		 * 
		 * @return the inverse of this matrix
		 */
		public function inverse( result : Matrix3d = null ) : Matrix3d
		{
			var d : Number = ( n11 * n22 - n12 * n21 ) * ( n33 * n44 - n34 * n43 ) + ( n13 * n21 - n11 * n23 ) * ( n32 * n44 - n34 * n42 ) + ( n11 * n24 - n14 * n21 ) * ( n32 * n43 - n33 * n42 ) + ( n12 * n23 - n13 * n22 ) * ( n31 * n44 - n34 * n41 ) + ( n14 * n22 - n12 * n24 ) * ( n31 * n43 - n33 * n41 ) + ( n13 * n24 - n14 * n23 ) * ( n31 * n42 - n32 * n41 );
			if ( d == 0 )
			{
				if( result )
				{
					result.n11 = NaN;
					result.n12 = NaN;
					result.n13 = NaN;
					result.n14 = NaN;
					result.n21 = NaN;
					result.n22 = NaN;
					result.n23 = NaN;
					result.n24 = NaN;
					result.n31 = NaN;
					result.n32 = NaN;
					result.n33 = NaN;
					result.n34 = NaN;
					result.n41 = NaN;
					result.n42 = NaN;
					result.n43 = NaN;
					result.n44 = NaN;
				}
				return null;
			}
			const det : Number = 1 / d;
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			if( ! result )
			{
				result = new Matrix3d();
			}
			
			result.n11 = det * ( o22 * ( o33 * o44 - o43 * o34 ) - o32 * ( o23 * o44 - o43 * o24 ) + o42 * ( o23 * o34 - o33 * o24 ) ) ;
			result.n12 = - det * ( o12 * ( o33 * o44 - o43 * o34 ) - o32 * ( o13 * o44 - o43 * o14 ) + o42 * ( o13 * o34 - o33 * o14 ) ) ;
			result.n13 = det * ( o12 * ( o23 * o44 - o43 * o24 ) - o22 * ( o13 * o44 - o43 * o14 ) + o42 * ( o13 * o24 - o23 * o14 ) ) ;
			result.n14 = - det * ( o12 * ( o23 * o34 - o33 * o24 ) - o22 * ( o13 * o34 - o33 * o14 ) + o32 * ( o13 * o24 - o23 * o14 ) ) ;
			result.n21 = - det * ( o21 * ( o33 * o44 - o43 * o34 ) - o31 * ( o23 * o44 - o43 * o24 ) + o41 * ( o23 * o34 - o33 * o24 ) ) ;
			result.n22 = det * ( o11 * ( o33 * o44 - o43 * o34 ) - o31 * ( o13 * o44 - o43 * o14 ) + o41 * ( o13 * o34 - o33 * o14 ) ) ;
			result.n23 = - det * ( o11 * ( o23 * o44 - o43 * o24 ) - o21 * ( o13 * o44 - o43 * o14 ) + o41 * ( o13 * o24 - o23 * o14 ) ) ;
			result.n24 = det * ( o11 * ( o23 * o34 - o33 * o24 ) - o21 * ( o13 * o34 - o33 * o14 ) + o31 * ( o13 * o24 - o23 * o14 ) ) ;
			result.n31 = det * ( o21 * ( o32 * o44 - o42 * o34 ) - o31 * ( o22 * o44 - o42 * o24 ) + o41 * ( o22 * o34 - o32 * o24 ) ) ;
			result.n32 = - det * ( o11 * ( o32 * o44 - o42 * o34 ) - o31 * ( o12 * o44 - o42 * o14 ) + o41 * ( o12 * o34 - o32 * o14 ) ) ;
			result.n33 = det * ( o11 * ( o22 * o44 - o42 * o24 ) - o21 * ( o12 * o44 - o42 * o14 ) + o41 * ( o12 * o24 - o22 * o14 ) ) ;
			result.n34 = - det * ( o11 * ( o22 * o34 - o32 * o24 ) - o21 * ( o12 * o34 - o32 * o14 ) + o31 * ( o12 * o24 - o22 * o14 ) ) ;
			result.n41 = - det * ( o21 * ( o32 * o43 - o42 * o33 ) - o31 * ( o22 * o43 - o42 * o23 ) + o41 * ( o22 * o33 - o32 * o23 ) ) ;
			result.n42 = det * ( o11 * ( o32 * o43 - o42 * o33 ) - o31 * ( o12 * o43 - o42 * o13 ) + o41 * ( o12 * o33 - o32 * o13 ) ) ;
			result.n43 = - det * ( o11 * ( o22 * o43 - o42 * o23 ) - o21 * ( o12 * o43 - o42 * o13 ) + o41 * ( o12 * o23 - o22 * o13 ) ) ;
			result.n44 = det * ( o11 * ( o22 * o33 - o32 * o23 ) - o21 * ( o12 * o33 - o32 * o13 ) + o31 * ( o12 * o23 - o22 * o13 ) ) ;

			return result;
		}

		/**
		 * Invert this matrix. If no inverse exists, the matrix is invalid and null
		 * is returned.
		 * 
		 * @return A reference to this matrix or null if no inverse exists
		 */
		public function invert() : Matrix3d
		{
			var d : Number = ( n11 * n22 - n12 * n21 ) * ( n33 * n44 - n34 * n43 ) + ( n13 * n21 - n11 * n23 ) * ( n32 * n44 - n34 * n42 ) + ( n11 * n24 - n14 * n21 ) * ( n32 * n43 - n33 * n42 ) + ( n12 * n23 - n13 * n22 ) * ( n31 * n44 - n34 * n41 ) + ( n14 * n22 - n12 * n24 ) * ( n31 * n43 - n33 * n41 ) + ( n13 * n24 - n14 * n23 ) * ( n31 * n42 - n32 * n41 );
			if ( d == 0 )
			{
				n11 = n12 = n13 = n14 = n21 = n22 = n23 = n24 = n31 = n32 = n33 = n34 = n41 = n42 = n43 = n44 = NaN;
				return null;
			}
			const det : Number = 1 / d;
			const o11 : Number = n11;
			const o12 : Number = n12;
			const o13 : Number = n13;
			const o14 : Number = n14;
			const o21 : Number = n21;
			const o22 : Number = n22;
			const o23 : Number = n23;
			const o24 : Number = n24;
			const o31 : Number = n31;
			const o32 : Number = n32;
			const o33 : Number = n33;
			const o34 : Number = n34;
			const o41 : Number = n41;
			const o42 : Number = n42;
			const o43 : Number = n43;
			const o44 : Number = n44;

			n11 = det * ( o22 * ( o33 * o44 - o43 * o34 ) - o32 * ( o23 * o44 - o43 * o24 ) + o42 * ( o23 * o34 - o33 * o24 ) ) ;
			n12 = - det * ( o12 * ( o33 * o44 - o43 * o34 ) - o32 * ( o13 * o44 - o43 * o14 ) + o42 * ( o13 * o34 - o33 * o14 ) ) ;
			n13 = det * ( o12 * ( o23 * o44 - o43 * o24 ) - o22 * ( o13 * o44 - o43 * o14 ) + o42 * ( o13 * o24 - o23 * o14 ) ) ;
			n14 = - det * ( o12 * ( o23 * o34 - o33 * o24 ) - o22 * ( o13 * o34 - o33 * o14 ) + o32 * ( o13 * o24 - o23 * o14 ) ) ;
			n21 = - det * ( o21 * ( o33 * o44 - o43 * o34 ) - o31 * ( o23 * o44 - o43 * o24 ) + o41 * ( o23 * o34 - o33 * o24 ) ) ;
			n22 = det * ( o11 * ( o33 * o44 - o43 * o34 ) - o31 * ( o13 * o44 - o43 * o14 ) + o41 * ( o13 * o34 - o33 * o14 ) ) ;
			n23 = - det * ( o11 * ( o23 * o44 - o43 * o24 ) - o21 * ( o13 * o44 - o43 * o14 ) + o41 * ( o13 * o24 - o23 * o14 ) ) ;
			n24 = det * ( o11 * ( o23 * o34 - o33 * o24 ) - o21 * ( o13 * o34 - o33 * o14 ) + o31 * ( o13 * o24 - o23 * o14 ) ) ;
			n31 = det * ( o21 * ( o32 * o44 - o42 * o34 ) - o31 * ( o22 * o44 - o42 * o24 ) + o41 * ( o22 * o34 - o32 * o24 ) ) ;
			n32 = - det * ( o11 * ( o32 * o44 - o42 * o34 ) - o31 * ( o12 * o44 - o42 * o14 ) + o41 * ( o12 * o34 - o32 * o14 ) ) ;
			n33 = det * ( o11 * ( o22 * o44 - o42 * o24 ) - o21 * ( o12 * o44 - o42 * o14 ) + o41 * ( o12 * o24 - o22 * o14 ) ) ;
			n34 = - det * ( o11 * ( o22 * o34 - o32 * o24 ) - o21 * ( o12 * o34 - o32 * o14 ) + o31 * ( o12 * o24 - o22 * o14 ) ) ;
			n41 = - det * ( o21 * ( o32 * o43 - o42 * o33 ) - o31 * ( o22 * o43 - o42 * o23 ) + o41 * ( o22 * o33 - o32 * o23 ) ) ;
			n42 = det * ( o11 * ( o32 * o43 - o42 * o33 ) - o31 * ( o12 * o43 - o42 * o13 ) + o41 * ( o12 * o33 - o32 * o13 ) ) ;
			n43 = - det * ( o11 * ( o22 * o43 - o42 * o23 ) - o21 * ( o12 * o43 - o42 * o13 ) + o41 * ( o12 * o23 - o22 * o13 ) ) ;
			n44 = det * ( o11 * ( o22 * o33 - o32 * o23 ) - o21 * ( o12 * o33 - o32 * o13 ) + o31 * ( o12 * o23 - o22 * o13 ) ) ;

			return this;
		}

		/**
		 * Transform a Vector3d using this matrix, returning a new, transformed vector.
		 * 
		 * @param vector The vector to transform.
		 * @param result The vector to hold the result of the transform. If
		 * no vector is passed, a new vector is created.
		 * 
		 * @return The result of the transformation.
		 */
		public function transformVector( vector : Vector3d, result : Vector3d = null ) : Vector3d
		{
			if ( result == null )
			{
				result = new Vector3d();
			}
			result.x = n11 * vector.x + n12 * vector.y + n13 * vector.z + n14 * vector.w;
			result.y = n21 * vector.x + n22 * vector.y + n23 * vector.z + n24 * vector.w;
			result.z = n31 * vector.x + n32 * vector.y + n33 * vector.z + n34 * vector.w;
			result.w = n41 * vector.x + n42 * vector.y + n43 * vector.z + n44 * vector.w;
			return result;
		}

		/**
		 * Transform a Vector3d using this matrix, storing the result in the original 
		 * vector.
		 * 
		 * @param vector The vector to transform.
		 * 
		 * @return A reference to the original (now transformed) vector.
		 */
		public function transformVectorSelf( vector : Vector3d ) : Vector3d
		{
			var x : Number = vector.x;
			var y : Number = vector.y;
			var z : Number = vector.z;
			var w : Number = vector.w;
			vector.x = n11 * x + n12 * y + n13 * z + n14 * w;
			vector.y = n21 * x + n22 * y + n23 * z + n24 * w;
			vector.z = n31 * x + n32 * y + n33 * z + n34 * w;
			vector.w = n41 * x + n42 * y + n43 * z + n44 * w;
			return vector;
		}

		/**
		 * Transform a Point3d using this matrix, returning a new, transformed point.
		 * 
		 * @param point The point to transform.
		 * @param result The point to hold the result of the transform. If
		 * no point is passed, a new point is created.
		 * 
		 * @return The result of the transformation.
		 */
		public function transformPoint( point : Point3d, result : Point3d = null ) : Point3d
		{
			if ( result == null )
			{
				result = new Point3d();
			}
			result.x = n11 * point.x + n12 * point.y + n13 * point.z + n14 * point.w;
			result.y = n21 * point.x + n22 * point.y + n23 * point.z + n24 * point.w;
			result.z = n31 * point.x + n32 * point.y + n33 * point.z + n34 * point.w;
			result.w = n41 * point.x + n42 * point.y + n43 * point.z + n44 * point.w;
			return result;
		}

		/**
		 * Transform a Point3d using this matrix, storing the result in the original 
		 * point.
		 * 
		 * @param point The point to transform.
		 * 
		 * @return A reference to the original (now transformed) vector.
		 */
		public function transformPointSelf( point : Point3d ) : Point3d
		{
			var x : Number = point.x;
			var y : Number = point.y;
			var z : Number = point.z;
			var w : Number = point.w;
			point.x = n11 * x + n12 * y + n13 * z + n14 * w;
			point.y = n21 * x + n22 * y + n23 * z + n24 * w;
			point.z = n31 * x + n32 * y + n33 * z + n34 * w;
			point.w = n41 * x + n42 * y + n43 * z + n44 * w;
			return point;
		}

		/**
		 * Transform a vector of Vector3d objects using this matrix. The 
		 * results are returned in a new vector.
		 * 
		 * @param v the vector of Vector3d objects to transform.
		 * @param result The vector to hold the results of the transform. If
		 * no vector is passed, a new vector is created. If the vector passed in
		 * contains Vector3d objects, these will be reused to hold the results 
		 * of the transform.
		 * 
		 * @return The vector containing the new transformed vectors.
		 */
		public function transformVectors( vectors : Vector.<Vector3d>, results : Vector.<Vector3d> = null ) : Vector.<Vector3d>
		{
			var length : uint = vectors.length;
			if( results == null )
			{
				results = new Vector.<Vector3d>( length );
			}
			else
			{
				results.length = length;
			}
			for( var i : uint = 0; i < length; ++i )
			{
				if( results[i] )
				{
					transformVector( vectors[i], results[i] );
				}
				else
				{
					results[i] = transformVector( vectors[i] );
				}
			}
			return results;
		}

		/**
		 * Transform a vector of Vector3d objects using this matrix. The 
		 * original vectors are modified to contain the new, transformed values.
		 * 
		 * @param v the vector of Vector3d objects to transform.
		 * 
		 * @return The original vector, which now contains the transformed vectors.
		 */
		public function transformVectorsSelf( vectors : Vector.<Vector3d> ) : Vector.<Vector3d>
		{
			for each ( var vector:Vector3d in vectors )
			{
				transformVectorSelf( vector );
			}
			return vectors;
		}

		/**
		 * Transform a vector of Point3d objects using this matrix. The 
		 * results are returned in a new vector.
		 * 
		 * @param v the vector of Point3d objects to transform.
		 * @param result The vector to hold the results of the transform. If
		 * no vector is passed, a new vector is created. If the vector passed in
		 * contains Point3d objects, these will be reused to hold the results 
		 * of the transform.
		 * 
		 * @return The vector containing the new transformed points.
		 */
		public function transformPoints( points : Vector.<Point3d>, results : Vector.<Point3d> = null ) : Vector.<Point3d>
		{
			var length : uint = points.length;
			if( results == null )
			{
				results = new Vector.<Point3d>( length );
			}
			else
			{
				results.length = length;
			}
			for( var i : uint = 0; i < length; ++i )
			{
				if( results[i] )
				{ 
					transformPoint( points[i], results[i] );
				}
				else
				{
					results[i] = transformPoint( points[i] );
				}
			}
			return results;
		}

		/**
		 * Transform a vector of Point3d objects using this matrix. The 
		 * original points are modified to contain the new, transformed values.
		 * 
		 * @param v the array of Point3d objects to transform.
		 * 
		 * @return The original vector, which now contains the transformed points.
		 */
		public function transformPointsSelf( points : Vector.<Point3d> ) : Vector.<Point3d>
		{
			for each ( var point:Point3d in points )
			{
				transformPointSelf( point );
			}
			return points;
		}

		/**
		 * The position elements of the matrix. This is the last column of the
		 * matrix, containing values n14, n24, n34, n44.
		 */
		public function get position() : Point3d
		{
			var p : Point3d = new Point3d( n14, n24, n34 );
			p.w = n44;
			return p;
		}

		public function set position( value : Point3d ) : void
		{
			n14 = value.x;
			n24 = value.y;
			n34 = value.z;
			n44 = value.w;
		}

		/**
		 * An array containing the sixteen values in the matrix, in row-major form.
		 * 
		 * <p>[n11, n12, n13, n14, n21, n22, n23, n24, n31, n32, n33, n34, n41, n42, n43, n44]</p>
		 */
		public function get rawData() : Vector.<Number>
		{
			var v:Vector.<Number> = new Vector.<Number>( 16 );
			v[0] = n11;
			v[1] = n12;
			v[2] = n13;
			v[3] = n14;
			v[4] = n21;
			v[5] = n22;
			v[6] = n23;
			v[7] = n24;
			v[8] = n31;
			v[9] = n32;
			v[10] = n33;
			v[11] = n34;
			v[12] = n41;
			v[13] = n42;
			v[14] = n43;
			v[15] = n44;
			return v;
		}

		public function set rawData( values : Vector.<Number> ) : void
		{
			if ( values.length < 12 )
			{
				throw new Error( "The raw data for the Matrix3d class must contain 12 or 16 values" );
			}
			n11 = values[0];
			n12 = values[1];
			n13 = values[2];
			n14 = values[3];
			n21 = values[4];
			n22 = values[5];
			n23 = values[6];
			n24 = values[7];
			n31 = values[8];
			n32 = values[9];
			n33 = values[10];
			n34 = values[11];
			if ( values.length < 16 )
			{
				n41 = 0;
				n42 = 0;
				n43 = 0;
				n44 = 1;
			}
			else
			{
				n41 = values[12];
				n42 = values[13];
				n43 = values[14];
				n44 = values[15];
			}
		}

		public function toString() : String
		{
			return "[Matrix3d] (" + n11 + ", " +  n12 + ", " +  n13 + ", " +  n14 + ", " +  n21 + ", " +  n22 + ", " +  n23 + ", " +  n24 + ", " +  n31 + ", " +  n32 + ", " +  n33 + ", " +  n34 + ", " +  n41 + ", " +  n42 + ", " +  n43 + ", " +  n44 + " )";
		}
	}
}
