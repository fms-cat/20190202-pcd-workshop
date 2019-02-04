float gaussian(float x, float s) {
  float s2 = 2.0 * s * s;
  return 1.0 / sqrt(s2 * PI) * exp(-x * x / s2);
}

void prepareGaussTable(float[] table, float sigma) {
  if (sigma <= 0.0) {
    for (int i = 0; i < table.length; i ++) {
      table[i] = i == 0 ? 1.0 : 0.0;
    }
  } else {
    float sum = 0.0;
    for (int i = 0; i < table.length; i ++) {
      float y = gaussian(i, sigma);
      table[i] = y;
      sum += (i == 0 ? 1.0 : 2.0) * y;
    }
    
    for (int i = 0; i < table.length; i ++) {
      table[i] = table[i] / sum;
    }
  }
}
