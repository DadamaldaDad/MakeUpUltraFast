/* MakeUp Ultra Fast - color_utils.glsl
Usefull functions for color manipulation.

Javier Garduño - GNU Lesser General Public License v3.0
*/

// const float ambient_multiplier = 1.3;
const float ambient_multiplier = 1.45;

// Ambient colors per hour
const vec3 ambient_baselight[25] =
  vec3[25](
  vec3(0.3764705882352941, 0.3411764705882353, 0.11372549019607843), // 6
  vec3(0.8352941176470589, 0.7372549019607844, 0.38823529411764707), // 7
  vec3(1.0, 0.9411764705882353, 0.7333333333333333), // 8
  vec3(1.0, 0.9882352941176471, 0.8), // 9
  vec3(1.0, 1.0, 0.85), // 10
  vec3(1.0, 1.0, 0.85), // 11
  vec3(1.0, 1.0, 0.85), // 12
  vec3(1.0, 1.0, 0.85), // 13
  vec3(1.0, 1.0, 0.85), // 14
  vec3(1.0, 0.9882352941176471, 0.8), // 15
  vec3(1.0, 0.9411764705882353, 0.7333333333333333), // 16
  vec3(0.8352941176470589, 0.7372549019607844, 0.38823529411764707), // 17
  vec3(0.3764705882352941, 0.3411764705882353, 0.11372549019607843), // 18
  vec3(0.13725490196078433, 0.08431372549019608, 0.14705882352941177), // 19
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 20
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 21
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 22
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 23
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 24
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 1
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 2
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 3
  vec3(0.07254901960784314, 0.0784313725490196, 0.12352941176470589), // 4
  vec3(0.13725490196078433, 0.08431372549019608, 0.14705882352941177), // 5
  vec3(0.3764705882352941, 0.3411764705882353, 0.11372549019607843) // 6
  );

// Ambient color luma per hour in exposure calculation
const float ambient_exposure[25] =
  float[25](
  .8, // 6
  1.0, // 7
  1.0, // 8
  1.0, // 9
  1.0, // 10
  1.0, // 11
  1.0, // 12
  1.0, // 13
  1.0, // 14
  1.0, // 15
  1.0, // 16
  1.0, // 17
  .8, // 18
  .7, // 19
  .1, // 20
  .1, // 21
  .1, // 22
  .1, // 23
  .1, // 24
  .1, // 1
  .1, // 2
  .1, // 3
  .1, // 4
  .7, // 5
  .8 // 6
  );

// How many sky_color vs. fog_color is used for fog.
const float fog_color_mix[25] =
  float[25](
  1.0, // 6
  .5, // 7
  .0, // 8
  .0, // 9
  .0, // 10
  .0, // 11
  .0, // 12
  .0, // 13
  .0, // 14
  .0, // 15
  .0, // 16
  .5, // 17
  1.0, // 18
  1.0, // 19
  1.0, // 20
  1.0, // 21
  1.0, // 22
  1.0, // 23
  1.0, // 24
  1.0, // 1
  1.0, // 2
  1.0, // 3
  1.0, // 4
  1.0, // 5
  1.0 // 6
  );

// Fog parameter per hour
const float fog_density[25] =
  float[25](
  2.0, // 6
  2.5, // 7
  3.0, // 8
  3.0, // 9
  3.0, // 10
  3.0, // 11
  3.0, // 12
  3.0, // 13
  3.0, // 14
  3.0, // 15
  3.0, // 16
  2.5, // 17
  1.0, // 18
  1.0, // 19
  2.5, // 20
  3.0, // 21
  3.0, // 22
  3.0, // 23
  3.0, // 24
  3.0, // 1
  3.0, // 2
  3.0, // 3
  2.5, // 4
  1.0, // 5
  2.0 // 6
  );

// Omni intesity per hour
const float omni_force[25] =
  float[25](
  .15, // 6
  .2, // 7
  .3, // 8
  .3, // 9
  .3, // 10
  .3, // 11
  .3, // 12
  .3, // 13
  .3, // 14
  .3, // 15
  .3, // 16
  .2, // 17
  .15, // 18
  .15, // 19
  .9, // 20
  1.0, // 21
  1.0, // 22
  1.0, // 23
  1.0, // 24
  1.0, // 1
  1.0, // 2
  1.0, // 3
  .9, // 4
  .15, // 5
  .15 // 6
  );

const vec3 candle_baselight = vec3(.666, 0.517129411764706, 0.2664);
// const vec3 candle_baselight = vec3(0.555, 0.4309411764705883, 0.22200000000000003);
const vec3 waterfog_baselight = vec3(0.09215686274509804, 0.23137254901960785, 0.3980392156862745);
