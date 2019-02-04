Quaternion myQuat;

void setup() {
  size(640, 480, P3D);
  myQuat = new Quaternion();
}

void draw() {
  background(0);

  Vector3 v = new Vector3(1, 0.2, 0).normalize();
  Quaternion q = quaternionByAngleAxis(0.1, v);
  myQuat = myQuat.multiply(q);

  pushMatrix();
  translate(width / 2, height / 2);
  applyMatrix(myQuat.toPMatrix3D());
  box(100);
  popMatrix();
}
