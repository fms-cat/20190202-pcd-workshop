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

void main() {
  float size = 1.0 + sin(time);
  vec3 shape = position.xyz - origin;
  vec3 p = origin + size * shape;

  gl_Position = transform * vec4(p, 1.0);

  vertColor = color;
  vertNormal = normalize(normalMatrix * normal);
  vertLightDir = -lightNormal;
}
