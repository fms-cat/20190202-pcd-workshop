#version 120

#define PIX_SIZE 4.0

uniform vec2 resolution;
uniform sampler2D texture;

float ditherThreshold(vec2 coord) {
  vec2 c = floor(mod(coord, 2.0));
  return c.x + 2.0 * mod(c.x + c.y, 2.0);
}

float gray(vec3 c) {
  return 0.299 * c.r + 0.587 * c.g + 0.114 * c.b;
}

vec3 gbColor(float v) {
  return mix(
    vec3(0.0, 0.1, 0.2),
    vec3(0.8, 1.0, 0.2),
    v
  );
}

float pix(vec2 coord) {
  vec4 pixCoord = vec4(
    (floor(coord.xy / PIX_SIZE) * PIX_SIZE) / resolution,
    mod(coord.xy, PIX_SIZE) / PIX_SIZE
  );
  if (1.0 / PIX_SIZE < pixCoord.z && 1.0 / PIX_SIZE < pixCoord.w) {
    vec4 tex = texture2D(texture, pixCoord.xy);
    float val = 4.0 * gray(tex.xyz);
    val += 0.25 * ditherThreshold(floor(coord.xy / PIX_SIZE));
    return 0.1 + 0.8 * pow(floor(val) / 4.0, 0.8);
  } else {
    return 1.0;
  }
}

void main() {
  float p = pix(gl_FragCoord.xy);

  vec3 col = gbColor(p);

  float shadow = 0.0;
  for (int iy = 0; iy < 3; iy ++) {
    for (int ix = 0; ix < 3; ix ++) {
      shadow += (
        (ix == 0 && iy == 0) ? p : pix(gl_FragCoord.xy + vec2(ix, iy))
      ) / 9.0;
    }
  }
  col *= mix(1.0, shadow, p);

  gl_FragColor = vec4(col, 1.0);
}