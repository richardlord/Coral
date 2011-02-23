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
	 * Point3D represents a point in three-dimensional cartesian coordinate space.
	 */
	public class Point3d
	{
		/**
		 * A zero point.
		 */
		public static function get ZERO():Point3d
		{
			return new Point3d( 0, 0, 0 );
		}

		/**
		 * The x coordinate of the point.
		 */
		public var x:Number;
		
		/**
		 * The y coordinate of the point.
		 */
		public var y:Number;
		
		/**
		 * The z coordinate of the point.
		 */
		public var z:Number;
		
		/**
		 * The w coordinate of the point.
		 * 
		 * <p>A point will always have a w coordinate which is not zero. A point's w coordinate 
		 * is usually, but not always, 1.</p>
		 */
		coral_internal var w:Number;

		/**
		 * Constructor
		 *
		 * @param x the x coordinate of the point
		 * @param y the y coordinate of the point
		 * @param z the z coordinate of the point
		 */
		public function Point3d( x:Number = 0, y:Number = 0, z:Number = 0 )
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.w = 1;
		}
		
		/**
		 * Assigns new coordinates to this point
		 * 
		 * @param x The new x coordinate
		 * @param y The new y coordinate
		 * @param z The new z coordinate
		 * 
		 * @return a reference to this Point3D object
		 */
		public function reset( x:Number = 0, y:Number = 0, z:Number = 0 ):Point3d
		{
			this.x = x;
			this.y = y;
			this.z = z;
			this.w = 1;
			return this;
		}
		
		/**
		 * Copies another point into this one.
		 * 
		 * @param p The point to copy
		 * 
		 * @return a reference to this point
		 */
		public function assign( p:Point3d ):Point3d
		{
			x = p.x;
			y = p.y;
			z = p.z;
			w = p.w;
			return this;
		}
		
		/**
		 * Makes a copy of this point.
		 * 
		 * @param result The point to hold the copy of this point. If
		 * no point is passed, a new point is created.
		 * 
		 * @return A copy of this point
		 */
		public function clone():Point3d
		{
			var result:Point3d = new Point3d( x, y, z );
			result.w = w;
			return result;
		}
		
		/**
		 * Tests is this point is the origin.
		 * 
		 * @return True if this is the origin, false otherwise.
		 */
		public function isZero():Boolean
		{
			return x == 0 && y == 0 && z == 0;
		}
		
		/**
		 * Adds a vector to this point, translating this point according to the vector, 
		 * and returns the result.
		 * 
		 * @param v the vector to add
		 * @param result The point to hold the result of the addition. If
		 * no point is passed, a new point is created.
		 * 
		 * @return the result of the addition
		 */
		public function add( v:Vector3d, result:Point3d = null ):Point3d
		{
			if( result == null )
			{
				return new Point3d( x + v.x, y + v.y, z + v.z );
			}
			result.x = x + v.x;
			result.y = y + v.y;
			result.z = z + v.z;
			return result;
		}
		
		/**
		 * Subtract a vector from this point, returning the result.
		 * 
		 * @param v The vector to subtract
		 * @param result The point to hold the result of the subtraction. If
		 * no point is passed, a new point is created.
		 * 
		 * @return The result of the subtraction
		 */		
		public function subtract( v:Vector3d, result:Point3d = null ):Point3d
		{
			if( result == null )
			{
				return new Point3d( x - v.x, y - v.y, z - v.z );
			}
			result.x = x - v.x;
			result.y = y - v.y;
			result.z = z - v.z;
			return result;
		}

		/**
		 * Create the vector from this point to another point.
		 * 
		 * @param p The other point
		 * @param result The vector to hold the result. If
		 * no vector is passed, a new vector is created.
		 * 
		 * @return The result of the subtraction
		 */		
		public function vectorTo( p:Point3d, result:Vector3d = null ):Vector3d
		{
			if( result == null )
			{
				return new Vector3d( p.x - x, p.y - y, p.z - z );
			}
			result.x = p.x - x;
			result.y = p.y - y;
			result.z = p.z - z;
			return result;
		}
		
		/**
		 * Add a vector to this point.
		 * 
		 * @param v The vector to add
		 * 
		 * @return A reference to this point.
		 */
		public function incrementBy( v:Vector3d ):Point3d
		{
			x += v.x;
			y += v.y;
			z += v.z;
			return this;
		}

		/**
		 * Subtract a vector from this point.
		 * 
		 * @param v The vector to subtract
		 * 
		 * @return A reference to this point.
		 */
		public function decrementBy( v:Vector3d ):Point3d
		{
			x -= v.x;
			y -= v.y;
			z -= v.z;
			return this;
		}
		
		/**
		 * Compare this point to another.
		 * 
		 * @param p The point to compare with
		 * 
		 * @return true if the points have the same coordinates, false otherwise
		 */
		public function equals( p:Point3d ):Boolean
		{
			return x == p.x && y == p.y && z == p.z;
		}

		/**
		 * Compare this point to another.
		 * 
		 * @param p The point to compare with
		 * @param e The distance allowed between the points.
		 * 
		 * @return true if the points are within distance e of each other, false otherwise
		 */
		public function nearTo( p:Point3d, e:Number ):Boolean
		{
			var dx:Number = x - p.x;
			var dy:Number = y - p.y;
			var dz:Number = z - p.z;
			return ( dx * dx + dy * dy + dz * dz ) <= e * e;
		}
		
		/**
		 * Calculates the distance between two points.
		 * 
		 * @param p the other point.
		 *
		 * @return the distance between the points.
		 */
		public function distance( p:Point3d ):Number
		{
			var dx:Number = x - p.x;
			var dy:Number = y - p.y;
			var dz:Number = z - p.z;
			return Math.sqrt( dx * dx + dy * dy + dz * dz );
		}
		
		/**
		 * Calculates the square of the distance between two points. This is faster than 
		 * calculating the actual distance.
		 * 
		 * @param p the other point.
		 *
		 * @return the square of the distance between the points.
		 */
		public function distanceSquared( p:Point3d ):Number
		{
			var dx:Number = x - p.x;
			var dy:Number = y - p.y;
			var dz:Number = z - p.z;
			return ( dx * dx + dy * dy + dz * dz );
		}
		
		/**
		 * Divide all the coordinates in this point by the w coordinate, 
		 * producing a point with a w coordinate of 1.
		 * 
		 * @return The projection of this point to a point with a w coordinate 
		 * of 1.
		 */
		public function project():Point3d
		{
			if( w == 0 )
			{
				throw new Error( "Can't project a point with a w coordinate of zero" );
			}
			var d:Number = 1 / w;
			x *= d;
			y *= d;
			z *= d;
			return this;
		}
		
		public function vectorFromOrigin( v:Vector3d = null ):Vector3d
		{
			if( v == null )
			{
				return new Vector3d( x, y, z );
			}
			v.x = x;
			v.y = y;
			v.z = z;
			return v;
		}
		
		/**
		 * Get a string representation of this point
		 * 
		 * @return a string representation of this point
		 */
		public function toString():String
		{
			return "[Point3D] (x=" + x + ", y=" + y + ", z=" + z + ")";
		}
	}
}
