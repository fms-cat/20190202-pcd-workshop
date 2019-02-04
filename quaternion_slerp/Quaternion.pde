class Quaternion {
  float w;
  Vector3 v;
  
  // Instantiate a new Quaternion.
  Quaternion(float _w, Vector3 _v) {
    w = _w;
    v = _v;
  }
  
  // Instantiate a new Quaternion.
  // It's an identity quaternion (represents "no rotation").
  Quaternion() {
    w = 1.0;
    v = new Vector3(0.0, 0.0, 0.0);
  }
  
  // Stringify the quaternion informations.
  public String toString() {
    return "Quaternion(" + w + "; " + v.x + ", " + v.y + ", " + v.z + ")";
  }
  
  Quaternion clone() {
    return new Quaternion(w, v.clone());
  }
  
  // Multiply this quaternion by given quaternion.
  Quaternion multiply(Quaternion _q) {
    Vector3 tv = new Vector3(0.0, 0.0, 0.0);
    tv = tv.add(_q.v.scale(w));
    tv = tv.add(v.scale(_q.w));
    tv = tv.add(v.cross(_q.v));
    return new Quaternion(
      w * _q.w - v.dot(_q.v),
      tv
    );
  }
  
  // Return its length, in float.
  float len() {
    return sqrt(v.dot(v) + w * w);
  }
  
  // Normalize itself.
  Quaternion normalize() {
    float l = len();
    
    if (l == 0) {
      return new Quaternion(1, new Vector3(0, 0, 0));
    } else {
      return new Quaternion(w / l, v.scale(1.0 / l));
    }
  }
  
  
  // Interpolate between this quaternion and given quaternion.
  Quaternion slerp(Quaternion _q, float _t) {
    Quaternion q = _q.clone();
    float cosHalfTheta = w * q.w + v.x * q.v.x + v.y * q.v.y + v.z * q.v.z;
    
    if (cosHalfTheta < 0) {
      q.w = -q.w;
      q.v = q.v.neg();
      cosHalfTheta = -cosHalfTheta;
    }
    
    if (1.0 <= cosHalfTheta) {
      return this.clone();
    }
    
    float sqSinHalfTheta = 1.0 - cosHalfTheta * cosHalfTheta;
    if (sqSinHalfTheta <= 1E-9) { // EPSILON
      float s = 1.0 - _t;
      q.w = s * w + _t * q.w;
      q.v = v.scale(s).add(q.v.scale(_t));
      return q.normalize();
    }
    
    float sinHalfTheta = sqrt(sqSinHalfTheta);
    float halfTheta = atan2(sinHalfTheta, cosHalfTheta);
    float rS = sin((1 - _t) * halfTheta) / sinHalfTheta;
    float rT = sin(_t * halfTheta) / sinHalfTheta;
    
    q.w = rS * w + rT * q.w;
    q.v = v.scale(rS).add(q.v.scale(rT));
    return q;
  }
  
  // Invert this quaternion.
  Quaternion inverse() {
    return new Quaternion(
      w,
      v.neg()
    );
  }
  
  // Convert this quaternion into Matrix.
  PMatrix3D toPMatrix3D() {
    Vector3 x = new Vector3(1.0, 0.0, 0.0).rotate(this);
    Vector3 y = new Vector3(0.0, 1.0, 0.0).rotate(this);
    Vector3 z = new Vector3(0.0, 0.0, 1.0).rotate(this);
    
    return new PMatrix3D(
      x.x, x.y, x.z, 0.0,
      y.x, y.y, y.z, 0.0,
      z.x, z.y, z.z, 0.0,
      0.0, 0.0, 0.0, 1.0
    );
  }
}

// Create a new quaternion by given angle and axis.
Quaternion quaternionByAngleAxis(float _t, Vector3 _a) {
  return new Quaternion(
    cos(_t / 2.0),
    _a.scale(sin(_t / 2.0))
  );
}
