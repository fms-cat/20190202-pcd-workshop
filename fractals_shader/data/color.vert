#define PI 3.14159265

uniform mat4 transform;
uniform mat3 normalMatrix;
uniform vec3 lightNormal;
uniform float time;

attribute vec4 position;
attribute vec4 color;
attribute vec3 normal;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

vec3 catColor(float f) {
  return 0.5 + 0.5 * sin(f + PI / 3.0 * vec3(0.0, 2.0, 4.0));
}

void main() {
  gl_Position = transform * position;

  float len = length(position);
  vertColor.rgb = catColor(10.0 * time - 0.1 * len);
  vertColor.a = 1.0;

  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}
