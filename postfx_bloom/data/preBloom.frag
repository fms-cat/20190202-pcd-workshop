uniform vec2 resolution;
uniform sampler2D texture;

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  vec4 tex = texture2D(texture, uv);

  gl_FragColor = vec4(clamp((2.0 * tex.xyz - 0.5), 0.0, 1.0), 1.0);
}