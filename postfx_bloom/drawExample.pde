void drawExample(PGraphics g) {
  g.beginDraw();
  
  g.background(0);
  g.noLights();
  g.noStroke();
  g.directionalLight(255, 255, 255, 1, 2, -3);

  g.pushMatrix();
  g.translate(width / 2, height / 2);
  for (int iy = 0; iy < 20; iy ++) {
    for (int ix = 0; ix < 20; ix ++) {
      g.pushMatrix();
      g.translate(
      20.0 * sin(0.4 * ix + 0.8 * iy + 0.03 * frameCount) + 12 * (ix - 9.5),
      20.0 * sin(0.3 * ix + 0.5 * iy + 0.04 * frameCount) + 12 * (iy - 9.5),
      20.0 * sin(0.7 * ix + 0.3 * iy + 0.05 * frameCount)
    );
      g.rotateX(0.28 * ix + frameCount * 0.05);
      g.rotateY(0.22 * iy + frameCount * 0.03);

      g.fill(64, 75, 86);
      g.box(20, 50, 70);
      g.fill(255, 82, 141);
      g.box(30, 40, 60);
      g.popMatrix();
    }
  }
  g.popMatrix();
  
  g.endDraw();
}
