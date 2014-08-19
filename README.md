PQuaternion
===========

Simple quaternion class for processing. To use, just copy Quaternion class to your project.


#Usage Example

```java
PVector v = new PVector(1,0,0);
Quaternion q = new Quaternion(radians(30), new PVector(0,0,1)); // rotate 30 degrees around z-axis
v = q.mult(v); // apply rotation to the vector
```

```java
PVector v2 = new PVector(0,1,0);
Quaternion xRot = new Quaternion(radians(30), new PVector(1,0,0)); // rotate 30 degrees around x-axis
Quaternion yRot = new Quaternion(radians(30), new PVector(0,1,0)); // rotate 30 degrees around y-axis
v2 = xRot.mult(yRot).mult(v2); // apply two rotations to the vector
```

#Reference

```java
Quaternion()
```

Constructor. Creates an identity quaternion.

```java
Quaternion(float _x, float _y, float _z, float _w)
```

Constructor. Sets four values of the quaternion.

```java
Quaternion(float angle, PVector axis)
```

Constructor. Sets rotation from an angle in radians around the given axis.

```java
Quaternion get()
```

Returns a copy of the quaternion.

```java
Boolean equal(Quaternion q)
```

Returns true if two quaternions are identical.

```java
void set(float _x, float _y, float _z, float _w)
```

Sets four values of the quaternion.

```java
void setAngleAxis(float angle, PVector axis)
```

Sets rotation from an angle in radians around the given axis.

```java
Quaternion conj()
```

Returns conjugation.

```java
Quaternion mult(float r)
```

Multiplies by scaler.

```java
Quaternion mult(Quaternion q)
```

Multiplies two quaternions and returns the result.

```java
PVector mult(PVector v)
```

Apply rotation to a vector and returns the results.

```java
void normalize()
```

Normalizes the quaternion.
