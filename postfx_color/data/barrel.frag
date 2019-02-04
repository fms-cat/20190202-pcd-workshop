#version 120

#define BARREL_ITER 10

#define PI 3.14159265
#define saturate(x) clamp(x,0.,1.)

uniform vec2 resolution;
uniform sampler2D texture;

vec2 barrel(vec2 uv, float amp) {
  float corn = length(vec2(0.5));
  float a = min(3.0 * sqrt(amp), corn * PI);
  float zoom = corn / (tan(corn * a) + corn);
  return saturate(
    (uv + normalize(uv - 0.5) * tan(length(uv - 0.5) * a)) * zoom +
    0.5 * (1.0 - zoom)
  );
}

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;

  vec3 col = vec3(0.0);
  for (int i = 0; i < BARREL_ITER; i ++) {
    float fi = (float(i) + 0.5) / float(BARREL_ITER);
    vec3 a = saturate( vec3(
      1.0 - 3.0 * abs(1.0 / 6.0 - fi),
      1.0 - 3.0 * abs(1.0 / 2.0 - fi),
      1.0 - 3.0 * abs(5.0 / 6.0 - fi)
    ) ) / float(BARREL_ITER) * 4.0;
    col += a * texture2D(texture, barrel(uv, 0.1 + 0.1 * fi)).xyz;
  }

  gl_FragColor = vec4(col, 1.0);
}