#version 120
/* MakeUp Ultra Fast - gbuffers_skytextured.vsh
Render: sun, moon

Javier Garduño - GNU Lesser General Public License v3.0
*/

varying vec2 texcoord;
varying vec4 color;

void main() {
  gl_Position = ftransform();
  texcoord = (gl_MultiTexCoord0).xy;
  color = gl_Color;
}