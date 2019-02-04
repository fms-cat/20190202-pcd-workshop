#define GAUSS_TABLE_LENGTH 64

uniform bool isVert;
uniform vec2 resolution;
uniform sampler2D texture;
uniform float gaussTable[GAUSS_TABLE_LENGTH];

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  vec2 dp = (isVert ? vec2(0.0, 1.0) : vec2(1.0, 0.0)) / resolution;

  vec4 sum = vec4(0.0);
  for (int i = -GAUSS_TABLE_LENGTH + 1; i < GAUSS_TABLE_LENGTH; i ++) {
    vec2 sampleUV = uv + dp * float(i);
    float weight = gaussTable[i < 0 ? -i : i];
    sum += weight * texture2D(texture, sampleUV);
  }

  gl_FragColor = sum;
}