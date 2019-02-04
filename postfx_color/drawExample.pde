void drawExample() {
  noLights();
  noStroke();
  directionalLight(255, 255, 255, 1, 2, -3);

  pushMatrix();
  translate(width / 2, height / 2);
  for (int iy = 0; iy < 20; iy ++) {
    for (int ix = 0; ix < 20; ix ++) {
      pushMatrix();
      translate(
      20.0 * sin(0.4 * ix + 0.8 * iy + 0.03 * frameCount) + 12 * (ix - 9.5),
      20.0 * sin(0.3 * ix + 0.5 * iy + 0.04 * frameCount) + 12 * (iy - 9.5),
      20.0 * sin(0.7 * ix + 0.3 * iy + 0.05 * frameCount)
    );
      rotateX(0.28 * ix + frameCount * 0.05);
      rotateY(0.22 * iy + frameCount * 0.03);

      fill(64, 75, 86);
      box(20, 50, 70);
      fill(231, 247, 255);
      box(30, 40, 60);
      popMatrix();
    }
  }
  popMatrix();
}
