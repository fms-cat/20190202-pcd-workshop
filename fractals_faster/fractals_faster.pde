final int FRACTAL_ITER = 4;

PShape myShape;

void setup() {
  size(640, 480, P3D);

  myShape = createShape();
  myShape.beginShape(QUADS);
  myShape.fill(255);
  myShape.noStroke();
  addFractals(myShape, 0, 0, 0, 300, FRACTAL_ITER);
  myShape.endShape();
}

void draw() {
  lights();

  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(frameCount / 300.0);
  rotateY(frameCount / 100.0);
  shape(myShape);
  popMatrix();

  text("FPS: " + frameRate, 20, 20);
}
