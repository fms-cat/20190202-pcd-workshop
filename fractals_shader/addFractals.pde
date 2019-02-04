void addFractals(PShape s, float x, float y, float z, float size, int iter) {
  if (iter == 0) {
    addCube(s, x, y, z, size);
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

        addFractals(
          s,
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
