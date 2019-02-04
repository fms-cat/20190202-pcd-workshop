Spring springX;
Spring springY;

void setup() {
  size(640, 480, P3D);
  springX = new Spring();
  springY = new Spring();
}

void draw() {
  float deltaTime = 1.0 / 60.0;
  springX.update(deltaTime);
  springY.update(deltaTime);

  background(0);
  
  ellipse(springX.position, springY.position, 50, 50);
}

void mousePressed() {
  springX.target = mouseX;
  springY.target = mouseY;
}

void mouseDragged() {
  springX.target = mouseX;
  springY.target = mouseY;
}
