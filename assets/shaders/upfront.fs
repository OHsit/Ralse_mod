#if defined(VERTEX) || __VERSION__ > 100 || defined(GL_FRAGMENT_PRECISION_HIGH)
    #define PRECISION highp
#else
    #define PRECISION mediump
#endif


extern PRECISION vec2 upfront;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern PRECISION vec2 image_details;
extern bool shadow;
uniform sampler2D iChannel0;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;
#define PI 3.14159265359
float luma(vec3 c) {return dot(vec3(.299,.578,.114),c);}
vec4 dissolve_mask(vec4 tex,vec2 texture_coords,vec2 uv);


//shader by int_45h
vec4 effect(vec4 colour,Image texture,vec2 texture_coords,vec2 screen_coords,in vec2 U )
{
    //basic stuff
    vec4 tex = Texel(texture, texture_coords);
   //uv stuff
   vec2 ires = love_ScreenSize.xy;
   vec2 uv = U/ires;
   //colors
    vec3 ca = vec3(.5,.01,.01),
         cb = vec3(.8,.3,.1);
    //ITime
    float iTime = tan(2. * time);
    //Count and shift amuont
    vec2 c_count = vec2(32,3);
    float sh = .15;
    // Background color
    vec3 bg = vec3(luma(Texel(iChannel0,uv).rgb)*2);
    //uv shifting
    uv -= vec2(iTime*.05,0);
    //Make the caverons. For each row
    // shift right else shift left
    float chy = fract(uv.y*c_count.y);
    float o = mix(0.,sh,(mod(uv.y*c_count.y,1.)>0.5f)?chy:1.-chy); 
    //applying offsets to uv
    vec2 uvc = uv+vec2(o,0.);
    //
    float d =floor(uvc.x*c_count.x);
    //color 1 trough N caverons diffrently
    float a = mod(d,3.)/3.;
    vec3 cc = mix(ca,cb,vec3(a));
    float t = sin(1.9*PI*(d-iTime*10.)/c_count.x);
    t = smoothstep(.3,.95,t);
    t = .4+.3*t;
    t *= .81+.19*sin(PI*chy);

    //Mix colors
    vec3 c = mix(bg,cc,t);
    tex.rgb = c ;
    return dissolve_mask(tex*colour, texture_coords, uv);
}

vec4 dissolve_mask(vec4 tex, vec2 texture_coords, vec2 uv)
{
    if (dissolve < 0.001) {
        return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, shadow ? tex.a*0.3: tex.a);
    }

    float adjusted_dissolve = (dissolve*dissolve*(3.-2.*dissolve))*1.02 - 0.01; //Adjusting 0.0-1.0 to fall to -0.1 - 1.1 scale so the mask does not pause at extreme values

	float t = time * 10.0 + 2003.;
	vec2 floored_uv = (floor((uv*texture_details.ba)))/max(texture_details.b, texture_details.a);
    vec2 uv_scaled_centered = (floored_uv - 0.5) * 2.3 * max(texture_details.b, texture_details.a);

	vec2 field_part1 = uv_scaled_centered + 50.*vec2(sin(-t / 143.6340), cos(-t / 99.4324));
	vec2 field_part2 = uv_scaled_centered + 50.*vec2(cos( t / 53.1532),  cos( t / 61.4532));
	vec2 field_part3 = uv_scaled_centered + 50.*vec2(sin(-t / 87.53218), sin(-t / 49.0000));

    float field = (1.+ (
        cos(length(field_part1) / 19.483) + sin(length(field_part2) / 33.155) * cos(field_part2.y / 15.73) +
        cos(length(field_part3) / 27.193) * sin(field_part3.x / 21.92) ))/2.;
    vec2 borders = vec2(0.2, 0.8);

    float res = (.5 + .5* cos( (adjusted_dissolve) / 82.612 + ( field + -.5 ) *3.14))
    - (floored_uv.x > borders.y ? (floored_uv.x - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y > borders.y ? (floored_uv.y - borders.y)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.x < borders.x ? (borders.x - floored_uv.x)*(5. + 5.*dissolve) : 0.)*(dissolve)
    - (floored_uv.y < borders.x ? (borders.x - floored_uv.y)*(5. + 5.*dissolve) : 0.)*(dissolve);

    if (tex.a > 0.01 && burn_colour_1.a > 0.01 && !shadow && res < adjusted_dissolve + 0.8*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
        if (!shadow && res < adjusted_dissolve + 0.5*(0.5-abs(adjusted_dissolve-0.5)) && res > adjusted_dissolve) {
            tex.rgba = burn_colour_1.rgba;
        } else if (burn_colour_2.a > 0.01) {
            tex.rgba = burn_colour_2.rgba;
        }
    }

    return vec4(shadow ? vec3(0.,0.,0.) : tex.xyz, res > adjusted_dissolve ? (shadow ? tex.a*0.3: tex.a) : .0);
}

// for transforming the card while your mouse is on it
extern PRECISION vec2 mouse_screen_pos;
extern PRECISION float hovering;
extern PRECISION float screen_scale;

#ifdef VERTEX
vec4 position( mat4 transform_projection, vec4 vertex_position )
{
    if (hovering <= 0.){
        return transform_projection * vertex_position;
    }
    float mid_dist = length(vertex_position.xy - 0.5*love_ScreenSize.xy)/length(love_ScreenSize.xy);
    vec2 mouse_offset = (vertex_position.xy - mouse_screen_pos.xy)/screen_scale;
    float scale = 0.2*(-0.03 - 0.3*max(0., 0.3-mid_dist))
                *hovering*(length(mouse_offset)*length(mouse_offset))/(2. -mid_dist);

    return transform_projection * vertex_position + vec4(0,0,0,scale);
}
#endif