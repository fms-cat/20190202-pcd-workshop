float x;
float y;
float xTarget;
float yTarget;

void setup() {
  size(640, 480, P3D);
}

void draw() {
  float deltaTime = 1.0 / 60.0;
  float k = 10.0;
  x = lerp(xTarget, x, exp(-k * deltaTime));
  y = lerp(yTarget, y, exp(-k * deltaTime));

  background(0);
  
  ellipse(x, y, 50, 50);
}

void mousePressed() {
  xTarget = mouseX;
  yTarget = mouseY;
}

void mouseDragged() {
  xTarget = mouseX;
  yTarget = mouseY;
}
