//Inspiered by this https://www.shadertoy.com/view/msySzK
extern PRECISION vec2 wired;
extern PRECISION number dissolve;
extern PRECISION number time;
extern PRECISION vec4 texture_details;
extern bool shadow;
extern PRECISION vec4 burn_colour_1;
extern PRECISION vec4 burn_colour_2;

vec4 dissolve_mask(vec4 tex,vec2 texture_coords,vec2 uv);

vec4 effect(vec4 colour,Image texture,vec2 texture_coords,vec2 screen_coords)
{
        // Take pixel color (rgba) from `texture` at `texture_coords`, equivalent of texture2D in GLSL
    vec4 tex = Texel(texture, texture_coords);
    // Position of a pixel within the sprite
	vec2 uv = (((texture_coords)*(image_details)) - texture_details.xy*texture_details.ba)/texture_details.ba;

    vec2 centerPoint = vec2(0.5,0.5)

    float ct = lenght(abs(texture_coords - centerPoint));
    float ctcol = ct;
    ct = pow(ct,3.0)
    ctcol = 1.0-pow(1.0-ct, 10.0);

    texture_coords.x += ct * sin(iTime*10.0 + (texture_coords.y - 0.5)*(ct*200.0)) /10.0;

    vec3 col = vec3(texture(iChannel0, texture_coords))

    //gradient hhhhhhhhhhhhh
    const float tMax = 4.0;
    float t = iTime;
    t += tex.r + tex.g + tex.b + texture_coords.x + texture_coords.y;
    const int colorSize = 4;
    vec3 color[colorSize];
    colors[0] = vec3(250.0/255.0, 62.0/255.0, 87.0/255.0);
    colors[1] = vec3(252.0/255.0, 210.0/255.0, 83.0/255.0);
    colors[2] = vec3(90.0/255.0, 252.0/255.0, 58.0/255.0);
    colors[3] = vec3(71.0/255.0, 197.0/255.0, 255.0/255.0);

    int c0 = int(floor(mod(t,float(colorSize))))
    
}