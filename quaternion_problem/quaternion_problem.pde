float rotX = 0.0;
float rotY = 0.0;

void setup() {
  size(640, 480, P3D);
}

void draw() {
  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(rotX);
  rotateY(rotY);
  box(100);
  popMatrix();
}

void mouseDragged() {
  float dx = mouseX - pmouseX;
  float dy = mouseY - pmouseY;
  
  rotX -= dy * 0.01;
  rotY += dx * 0.01;
}
