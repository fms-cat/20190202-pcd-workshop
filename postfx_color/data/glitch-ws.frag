uniform vec2 resolution;
uniform sampler2D texture;

float rand(vec2 co) {
  return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  vec2 lofiUv = floor(uv * 10.0) / 10.0;
  uv += 0.1 - 0.2 * vec2(
    rand(lofiUv),
    rand(lofiUv + 0.7)
  );
  uv = fract(uv);
  vec4 tex = texture2D(texture, uv);
  gl_FragColor = tex;
}