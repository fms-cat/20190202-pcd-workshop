final int GAUSS_TABLE_LENGTH = 64;

PShader gaussShader;
float[] gaussTable;

void setup() {
  size(640, 480, P3D);
  gaussTable = new float[GAUSS_TABLE_LENGTH];
  prepareGaussTable(gaussTable, 5.0);
  gaussShader = loadShader("gauss.frag");
}

void draw() {
  background(0);
  drawExample();

  gaussShader.set("resolution", float(width), float(height));
  gaussShader.set("gaussTable", gaussTable);

  gaussShader.set("isVert", false);
  filter(gaussShader);
  gaussShader.set("isVert", true);
  filter(gaussShader);
}

void mouseMoved() {
  prepareGaussTable(gaussTable, mouseY);
}
