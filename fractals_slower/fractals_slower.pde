final int FRACTAL_ITER = 4;

void drawFractals(float x, float y, float z, float size, int iter) {
  if (iter == 0) {
    pushMatrix();
    fill(x, y, z);
    translate(x, y, z);
    box(size);
    popMatrix();
    
    return;
  }

  for (int iz = -1; iz <= 1; iz ++) {
    for (int iy = -1; iy <= 1; iy ++) {
      for (int ix = -1; ix <= 1; ix ++) {
        int abort = 0;
        abort += ix == 0 ? 1 : 0;
        abort += iy == 0 ? 1 : 0;
        abort += iz == 0 ? 1 : 0;
        if (2 <= abort) {
          continue;
        }

        drawFractals(
          x + ix * size / 3, 
          y + iy * size / 3, 
          z + iz * size / 3, 
          size / 3, 
          iter - 1
        );
      }
    }
  }
}

void setup() {  
  size(640, 480, P3D);
  noStroke();
}

void draw() {
  lights();

  background(0);

  pushMatrix();
  translate(width / 2, height / 2);
  rotateX(frameCount / 300.0);
  rotateY(frameCount / 100.0);
  drawFractals(0, 0, 0, 300, FRACTAL_ITER);
  popMatrix();

  text("FPS: " + frameRate, 20, 20);
}
