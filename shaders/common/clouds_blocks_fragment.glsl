#include "/lib/config.glsl"

/* Config, uniforms, ins, outs */
uniform sampler2D tex;
uniform float far;
uniform float blindness;

#if MC_VERSION >= 11900
  uniform float darknessFactor;
  uniform float darknessLightFactor;
#endif

#if V_CLOUDS == 0 || defined UNKNOWN_DIM
  uniform float pixel_size_x;
  uniform float pixel_size_y;
  uniform sampler2D gaux4;
#endif

// Varyings (per thread shared variables)
#if V_CLOUDS == 0 || defined UNKNOWN_DIM
  varying vec2 texcoord;
  varying vec4 tint_color;
#endif

void main() {
  #if V_CLOUDS == 0 || defined UNKNOWN_DIM
    vec4 block_color = texture2D(tex, texcoord) * tint_color;
    #include "/src/cloudfinalcolor.glsl"
    #include "/src/writebuffers.glsl"
  #endif
}
