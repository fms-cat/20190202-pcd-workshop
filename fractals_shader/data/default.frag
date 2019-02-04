#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;

void main() {
  float intensity = max(0.0, dot(vertLightDir, vertNormal));
  vec3 diffuse = vertColor.xyz * intensity;
  gl_FragColor = vec4(diffuse, vertColor.w);
}