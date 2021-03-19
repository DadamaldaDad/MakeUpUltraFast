#version 130
/* MakeUp - gbuffers_entities.fsh
Render: Droped objects, mobs and things like that

Javier Garduño - GNU Lesser General Public License v3.0
*/

#define THE_END

#include "/lib/config.glsl"

// 'Global' constants from system
uniform sampler2D tex;
uniform int entityId;
uniform int isEyeInWater;
uniform float nightVision;
uniform float rainStrength;
uniform vec4 entityColor;

#if SHADOW_CASTING == 1
  uniform sampler2D colortex5;
  uniform float frameTimeCounter;
  uniform sampler2DShadow shadowtex1;
#endif

// Varyings (per thread shared variables)
varying vec2 texcoord;
varying vec2 lmcoord;
varying vec4 tint_color;
varying vec3 current_fog_color;
varying float frog_adjust;

varying vec3 direct_light_color;
varying vec3 candle_color;
varying float direct_light_strenght;
varying vec3 omni_light;

#if SHADOW_CASTING == 1
  varying vec3 shadow_pos;
  varying float shadow_diffuse;
#endif

#if SHADOW_CASTING == 1
  #include "/lib/dither.glsl"
  #include "/lib/shadow_frag.glsl"
#endif

void main() {
  // Toma el color puro del bloque
  #if BLACK_ENTITY_FIX == 1
    vec4 block_color = texture(tex, texcoord);
    if (block_color.a < 0.1) {   // Blacl entities bug workaround
      discard;
    }
    block_color *= tint_color;
  #else
    vec4 block_color = texture(tex, texcoord) * tint_color;
  #endif

  float shadow_c;

  #if SHADOW_CASTING == 1
    if (lmcoord.y > 0.005) {
      shadow_c = get_shadow(shadow_pos);
      shadow_c = mix(shadow_c, 1.0, rainStrength);
      shadow_c = mix(shadow_c, 1.0, shadow_diffuse);
    } else {
      shadow_c = 1.0;
    }

  #else
    shadow_c = 1.0;
  #endif

  vec3 real_light =
    omni_light +
    (direct_light_strenght * shadow_c * direct_light_color) * (1.0 - rainStrength) +
    candle_color;

  block_color.rgb *= mix(real_light, vec3(1.0), nightVision * .125);
  block_color.rgb = mix(block_color.rgb, entityColor.rgb, entityColor.a * .75);

  #include "/src/finalcolor.glsl"
  #include "/src/writebuffers.glsl"
}
