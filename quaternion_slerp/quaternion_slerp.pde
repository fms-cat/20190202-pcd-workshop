Quaternion myQuatA;
Quaternion myQuatB;

void setup() {
  size(640, 480, P3D);
  myQuatA = new Quaternion();
  myQuatB = quaternionByAngleAxis(PI / 2, new Vector3(1, 1, 1).normalize());
}

void draw() {
  Quaternion q = myQuatA.slerp(myQuatB, float(mouseX) / width);

  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  applyMatrix(q.toPMatrix3D());
  box(100);
  popMatrix();
}
