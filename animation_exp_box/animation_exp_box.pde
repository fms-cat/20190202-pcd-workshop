float time = 0.0;

void setup() {
  size(640, 480, P3D);
}

void draw() {
  time += 1.0 / 60.0;
  //float anim = constrain(time, 0.0, 1.0);
  float anim = 1.0 - exp(-5.0 * time);

  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  rotateY(anim);
  rotateX(0.5 * anim);
  box(100 * anim);
  popMatrix();
}

void keyPressed() {
  time = 0.0;
}
