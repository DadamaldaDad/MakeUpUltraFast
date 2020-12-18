/* MakeUp Ultra Fast - color_utils.glsl
Usefull data for color manipulation.

Javier Garduño - GNU Lesser General Public License v3.0
*/

// Direct light color per hour
const vec3 ambient_baselight[25] =
  vec3[25](
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849), // 6
  vec3(0.835294117647059, 0.737254901960784, 0.29117647058823526), // 7
  vec3(1.0, 0.941176470588235, 0.5499999999999997), // 8
  vec3(1.0, 0.988235294117647, 0.6), // 9
  vec3(1.0, 1., 0.6375), // 10
  vec3(1.0, 1., 0.6375), // 11
  vec3(1.0, 1., 0.6375), // 12
  vec3(1.0, 1., 0.6375), // 1
  vec3(1.0, 1., 0.6375), // 2
  vec3(1.0, 0.988235294117647, 0.6), // 3
  vec3(1.0, 0.941176470588235, 0.5499999999999997), // 4
  vec3(0.835294117647059, 0.737254901960784, 0.29117647058823526), // 5
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849), // 6
  vec3(0.10294118, 0.06323529, 0.08272059), // 7
  vec3(0.03627451, 0.03921569, 0.04632353), // 8
  vec3(0.03627451, 0.03921569, 0.04632353), // 9
  vec3(0.03627451, 0.03921569, 0.04632353), // 10
  vec3(0.03627451, 0.03921569, 0.04632353), // 11
  vec3(0.03627451, 0.03921569, 0.04632353), // 12
  vec3(0.03627451, 0.03921569, 0.04632353), // 1
  vec3(0.03627451, 0.03921569, 0.04632353), // 2
  vec3(0.03627451, 0.03921569, 0.04632353), // 3
  vec3(0.03627451, 0.03921569, 0.04632353), // 4
  vec3(0.10294118, 0.06323529, 0.08272059), // 5
  vec3(0.376470588235294, 0.341176470588235, 0.08529411764705849) // 6
);

// Ambient color luma per hour in exposure calculation
const float ambient_exposure[25] =
  float[25](
  1.0, // 6
  1.0, // 7
  1.0, // 8
  1.0, // 9
  1.0, // 10
  1.0, // 11
  1.0, // 12
  1.0, // 1
  1.0, // 2
  1.0, // 3
  1.0, // 4
  1.0, // 5
  1.0, // 6
  .6, // 7
  .5, // 8
  .5, // 9
  .5, // 10
  .5, // 11
  .5, // 12
  .5, // 1
  .5, // 2
  .5, // 3
  .5, // 4
  .6, // 5
  1.0 // 6
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

const float omni_force[25] =
  float[25](
  .5, // 6
  .666666, // 7
  1.0, // 8
  1.0, // 9
  1.0, // 10
  1.0, // 11
  1.0, // 12
  1.0, // 13
  1.0, // 14
  1.0, // 15
  1.0, // 16
  .666666, // 17
  .5, // 18
  .5, // 19
  3.0, // 20
  3.333333, // 21
  3.333333, // 22
  3.333333, // 23
  3.333333, // 24
  3.333333, // 1
  3.333333, // 2
  3.333333, // 3
  3.0, // 4
  .5, // 5
  .5 // 6
  );

const vec3 candle_baselight = vec3(.666, 0.517129411764706, 0.2664);
