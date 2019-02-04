#version 120

uniform vec2 resolution;
uniform float threshold = 0.1;
uniform float amp = 0.5;
uniform sampler2D texture;

// ------

float seg( vec2 uv, vec2 s ) {
  return floor( s.x * uv.x ) + s.x * floor( s.y * uv.y );
}

float random( float v ) {
  return fract( sin( 691.43 * v ) * 571.54 );
}

// ------

void main() {
  vec2 uv = gl_FragCoord.xy / resolution;

  vec2 displace = vec2( 0.0 );
  for ( int i = 0; i < 4; i ++ ) {
    float m = pow( 2.0, float( i ) );
    float id = seg( uv + 0.7 * float( i ), vec2( 3.0, 8.0 ) * m );
    bool b = random( 0.2 + id ) < threshold;
    displace += b ? vec2(
      random( 0.5 + id ) * 2.0 - 1.0,
      random( 0.8 + id ) * 2.0 - 1.0
    ) / 2.0 / m : vec2( 0.0 );
  }
  displace = amp * displace;

  vec3 col = vec3(
    texture2D( texture, uv + 1.00 * displace ).x,
    texture2D( texture, uv + 1.05 * displace ).y,
    texture2D( texture, uv + 1.10 * displace ).z
  );
  gl_FragColor = vec4( col, 1.0 );
}