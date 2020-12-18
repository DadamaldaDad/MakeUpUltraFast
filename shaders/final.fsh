#version 120
/* MakeUp Ultra Fast - final.fsh
Render: Final renderer

Javier Garduño - GNU Lesser General Public License v3.0
*/

#define NO_SHADOWS

#include "/lib/config.glsl"

// Do not remove comments. It works!
/*

colortex0 - Main color canvas
colortex1 - Antialiasing auxiliar
colortex2 - TAA Averages history
colortex3 - Blur Auxiliar
gaux1 - Reflection texture
colortex5 - Blue noise texture
colortex6 - Not used
colortex7 - Not used

const int colortex0Format = R11F_G11F_B10F;
const int colortex1Format = RGBA16F;
const int colortex2Format = RGBA16F;
const int colortex3Format = RGBA16F;
const int gaux1Format = RGB8;
const int colortex5Format = R8;
const int colortex6Format = R8;
*/

// 'Global' constants from system
uniform ivec2 eyeBrightnessSmooth;
uniform int current_hour_floor;
uniform int current_hour_ceil;
uniform float current_hour_fract;

uniform sampler2D colortex0;

// Varyings (per thread shared variables)
varying vec2 texcoord;

#include "/lib/color_utils.glsl"
#include "/lib/basic_utils.glsl"
#include "/lib/tone_maps.glsl"

void main() {
  vec3 block_color = texture2D(colortex0, texcoord).rgb;

  // Tonemaping ---
  // x: Block, y: Sky ---
  // float candle_bright = (eyeBrightnessSmooth.x / 240.0) * .1;
  float exposure_coef =
    mix(
      ambient_exposure[current_hour_floor],
      ambient_exposure[current_hour_ceil],
      current_hour_fract
    );
  // float exposure =
  //   ((eyeBrightnessSmooth.y / 240.0) * exposure_coef) + candle_bright;

  float exposure =
    ((eyeBrightnessSmooth.y * 0.00416666666666666) * exposure_coef);  // 1/240

  // Map from 1.0 - 0.0 to 1.3 - 4.8
  exposure = (exposure * -3.5) + 4.8;

  block_color *= exposure;
  block_color = lottes_tonemap(block_color, exposure);

  gl_FragColor = vec4(block_color, 1.0);
}
