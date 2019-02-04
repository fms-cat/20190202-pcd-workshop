size(256, 256);

loadPixels();
for (int iy = 0; iy < height; iy ++) {
  for (int ix = 0; ix < width; ix ++) {
    float r = ix * 256.0 / width;
    float g = iy * 256.0 / height;
    float b = 127.0;
    pixels[ix + iy * width] = color(r, g, b);
  }
}
updatePixels();
