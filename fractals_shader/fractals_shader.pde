final int FRACTAL_ITER = 4;

PShape myShape;
PShader myShader;

void setup() {
  size(640, 480, P3D);

  myShape = createShape();
  myShape.beginShape(QUADS);
  myShape.fill(255);
  myShape.noStroke();
  addFractals(myShape, 0, 0, 0, 300, FRACTAL_ITER);
  myShape.endShape();
  
  myShader = loadShader("default.frag", "default.vert");
}

void draw() {
  myShader.set("time", frameCount / 60.0);
  
  directionalLight(255, 255, 255, 1, 2, -3);

  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(frameCount / 300.0);
  rotateY(frameCount / 100.0);
  shader(myShader);
  shape(myShape);
  resetShader();
  popMatrix();

  text("FPS: " + frameRate, 20, 20);
}
