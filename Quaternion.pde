public class Quaternion {
  
public float x, y, z, w;
public Quaternion() {
    x = y = z = 0;
    w = 1;
}

public Quaternion(float _x, float _y, float _z, float _w) {
    x = _x;
    y = _y;
    z = _z;
    w = _w;
}

public Quaternion(float angle, PVector axis) {
    setAngleAxis(angle, axis);
}

public Quaternion get() {
    return new Quaternion(x, y, z, w);
}

public Boolean equal(Quaternion q) {
    return x == q.x && y == q.y && z == q.z && w == q.w;
}

public void set(float _x, float _y, float _z, float _w) {
    x = _x;
    y = _y;
    z = _z;
    w = _w;
}

public void setAngleAxis(float angle, PVector axis) {
    axis.normalize();
    float hcos = cos(angle / 2);
    float hsin = sin(angle / 2);
    w = hcos;
    x = axis.x * hsin;
    y = axis.y * hsin;
    z = axis.z * hsin;
}

public Quaternion conj() {
    Quaternion ret = new Quaternion();
    ret.x = -x;
    ret.y = -y;
    ret.z = -z;
    ret.w = w;
    return ret;
}

public Quaternion mult(float r) {
    Quaternion ret = new Quaternion();
    ret.x = x * r;
    ret.y = y * r;
    ret.z = z * r;
    ret.w = w * w;
    return ret;
}

public Quaternion mult(Quaternion q) {
    Quaternion ret = new Quaternion();
    ret.x = q.w*x + q.x*w + q.y*z - q.z*y;
    ret.y = q.w*y - q.x*z + q.y*w + q.z*x;
    ret.z = q.w*z + q.x*y - q.y*x + q.z*w;
    ret.w = q.w*w - q.x*x - q.y*y - q.z*z;
    return ret;
}


public PVector mult(PVector v) {
  float px = (1 - 2 * y * y - 2 * z * z) * v.x +
             (2 * x * y - 2 * z * w) * v.y +
             (2 * x * z + 2 * y * w) * v.z;
             
  float py = (2 * x * y + 2 * z * w) * v.x +
             (1 - 2 * x * x - 2 * z * z) * v.y +
             (2 * y * z - 2 * x * w) * v.z;
             
  float pz = (2 * x * z - 2 * y * w) * v.x +
             (2 * y * z + 2 * x * w) * v.y +
             (1 - 2 * x * x - 2 * y * y) * v.z;

    return new PVector(px, py, pz);
}

public void normalize(){
  float len = w*w + x*x + y*y + z*z;
  float factor = 1.0f / sqrt(len);
  x *= factor;
  y *= factor;
  z *= factor;
  w *= factor;
}

}
