size(256, 256, P3D);
PShader shader = loadShader("uv.frag");
shader.set("resolution", float(width), float(height));
filter(shader);
