Quaternion myQuat;

void setup() {
  size(640, 480, P3D);
  myQuat = new Quaternion();
}

void draw() {
  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  applyMatrix(myQuat.toPMatrix3D());
  box(100);
  popMatrix();
}

void mouseDragged() {
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  Vector3 v = new Vector3(dy, -dx, 0);

  Quaternion q = quaternionByAngleAxis(v.len() * 0.01, v.normalize());
  myQuat = myQuat.multiply(q);
}
