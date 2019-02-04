final int GAUSS_TABLE_LENGTH = 64;

PShader preBloomShader;
PShader gaussShader;
float[] gaussTable;
PGraphics bloomContext;

void setup() {
  size(640, 480, P3D);
  preBloomShader = loadShader("preBloom.frag");
  gaussTable = new float[GAUSS_TABLE_LENGTH];
  prepareGaussTable(gaussTable, 10.0);
  gaussShader = loadShader("gauss.frag");
  bloomContext = createGraphics(width, height, P3D);
}

void draw() {
  blendMode(BLEND);
  background(0);
  drawExample(bloomContext);

  image(bloomContext, 0, 0);
  filter(preBloomShader);

  gaussShader.set("resolution", float(width), float(height));
  gaussShader.set("gaussTable", gaussTable);

  gaussShader.set("isVert", false);
  filter(gaussShader);
  gaussShader.set("isVert", true);
  filter(gaussShader);
  
  blendMode(ADD);
  image(bloomContext, 0, 0);
}

void mouseMoved() {
  prepareGaussTable(gaussTable, mouseY);
}
