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
