#version 140
/* MakeUp Ultra Fast - gbuffers_skytextured.fsh
Render: sun, moon

Javier Garduño - GNU Lesser General Public License v3.0
*/

#define NO_SHADOWS

#include "/lib/config.glsl"

varying vec2 texcoord;
varying vec4 tint_color;

uniform sampler2D gcolor;

void main() {
  // Toma el color puro del bloque
  vec4 block_color = texture(gcolor, texcoord) * tint_color;

  #include "/src/writebuffers.glsl"
}
