PShader colorShader;

void setup() {
  size(640, 480, P3D);
  colorShader = loadShader("glitch-ws.frag");
}

void draw() {
  background(0);
  drawExample();

  colorShader.set("resolution", float(width), float(height));
  filter(colorShader);
}
