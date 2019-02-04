#version 120

uniform vec2 resolution;
uniform float blend = 1.0;
uniform sampler2D texture;

// ------

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;
  vec2 p = (2.0 * gl_FragCoord.xy - resolution) / resolution.y;

  vec4 tex = texture2D(texture, uv);

  vec3 col = tex.xyz;
  col *= 1.0 - 0.5 * length(p);
  col = vec3(
    smoothstep(0.0, 1.0, col.x),
    col.y,
    0.1 + 0.8 * col.z
  );
  col = mix(tex.xyz, col, blend);

  gl_FragColor = vec4(col, 1.0);
}