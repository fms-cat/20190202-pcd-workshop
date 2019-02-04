class Vector3 {
  float x, y, z;

  // Instantiate a new Vector3.
  Vector3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  // Stringify the vector informations.
  public String toString() {
    return "Vector3(" + x + ", " + y + ", " + z + ")";
  }
  
  // Copy itself.
  Vector3 clone() {
    return new Vector3(x, y, z);
  }
  
  // Add two vectors.
  Vector3 add(Vector3 v) {
    return new Vector3(x + v.x, y + v.y, z + v.z);
  }
  
  // Substract this vector by a vector.
  Vector3 sub(Vector3 v) {
    return new Vector3(x - v.x, y - v.y, z - v.z);
  }
  
  // Scale this vector by a scalar.
  Vector3 scale(float s) {
    return new Vector3(x * s, y * s, z * s);
  }
  
  // Negate this vector.
  Vector3 neg() {
    return new Vector3(-x, -y, -z);
  }
  
  // Return its length, in float.
  float len() {
    return sqrt(x * x + y * y + z * z);
  }
  
  // Normalize the vector (make its length = 1).
  Vector3 normalize() {
    return scale(1.0 / len());
  }
  
  // Return a dot product of this vector and given vector.
  float dot(Vector3 v) {
    return x * v.x + y * v.y + z * v.z;
  }
  
  // Return a cross product of this vector and given vector.
  Vector3 cross(Vector3 v) {
    return new Vector3(y * v.z - v.y * z,
                       z * v.x - v.z * x,
                       x * v.y - v.x * y);
  }
  
  // Rotate this vector by a quaternion.
  Vector3 rotate(Quaternion _q) {
    Quaternion p = new Quaternion(0.0, this);
    Quaternion r = _q.inverse();
    return _q.multiply(p).multiply(r).v;
  }
}
