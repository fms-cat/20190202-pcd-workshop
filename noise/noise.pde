size(100, 100);

loadPixels();
for (int iy = 0; iy < height; iy ++) {
  for (int ix = 0; ix < width; ix ++) {
    float v = 256.0 * noise(0.1 * ix, 0.1 * iy);
    pixels[ix + iy * width] = color(v, v, v);
  }
}
updatePixels();
