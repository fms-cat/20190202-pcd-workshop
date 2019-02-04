#define PI 3.14159265

uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform float time;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;
attribute vec3 origin;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

vec3 catColor(float f) {
  return 0.5 + 0.5 * sin(f + PI / 3.0 * vec3(0.0, 2.0, 4.0));
}

void main() {
  float len = length(position);
  float phase = fract(time - 0.01 * len);
  float wave = 0.5 - 0.5 * cos(2.0 * PI * exp(-4.0 * phase));

  float size = 4.0 * wave;
  vec3 shape = position.xyz - origin;
  vec3 p = origin + size * shape;

  gl_Position = transform * vec4(p, 1.0);
  vertColor.rgb = catColor(3.0 - 3.0 * wave);
  vertColor.a = 1.0;

  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}
