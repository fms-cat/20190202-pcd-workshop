void addCube(PShape s, float x, float y, float z, float size) {
  float v = size / 2;
  
  s.fill(x, y, z);
  s.attrib("origin", x, y, z);

  // x+
  s.vertex(x + v, y - v, z + v);
  s.vertex(x + v, y - v, z - v);
  s.vertex(x + v, y + v, z - v);
  s.vertex(x + v, y + v, z + v);

  // x-
  s.vertex(x - v, y - v, z - v);
  s.vertex(x - v, y - v, z + v);
  s.vertex(x - v, y + v, z + v);
  s.vertex(x - v, y + v, z - v);

  // y+
  s.vertex(x - v, y + v, z + v);
  s.vertex(x + v, y + v, z + v);
  s.vertex(x + v, y + v, z - v);
  s.vertex(x - v, y + v, z - v);

  // y-
  s.vertex(x - v, y - v, z - v);
  s.vertex(x + v, y - v, z - v);
  s.vertex(x + v, y - v, z + v);
  s.vertex(x - v, y - v, z + v);

  // z+
  s.vertex(x - v, y - v, z + v);
  s.vertex(x + v, y - v, z + v);
  s.vertex(x + v, y + v, z + v);
  s.vertex(x - v, y + v, z + v);

  // z-
  s.vertex(x + v, y - v, z - v);
  s.vertex(x - v, y - v, z - v);
  s.vertex(x - v, y + v, z - v);
  s.vertex(x + v, y + v, z - v);
}
