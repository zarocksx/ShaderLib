// Made by : Krzysztof Jankowski -> https://bits.p1x.in/godot-shader-vigdeting-chromatic-aberrations/
shader_type spatial;

uniform float light : hint_range(0, 1);
uniform float extend : hint_range(0, 1);
uniform float offset : hint_range(0, 100);

void fragment() {
    vec2 uv = UV;
    vec3 chroma;
    float amount = offset * 0.0005;

    // cache screen
    vec3 og_color = textureLod( SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;

    // cache screen witch chroma (r/b shifted by ammount)
    chroma.r = textureLod( SCREEN_TEXTURE, SCREEN_UV + vec2(amount, 0.), 0.0).r;
    chroma.g = og_color.g;
    chroma.b = textureLod( SCREEN_TEXTURE, SCREEN_UV - vec2(amount, 0.), 0.0).b;
    
    // generate gradient from center to the corners
    uv *=  1.0 - uv.yx;
    float vig = uv.x*uv.y * 15.;
    vig = pow(vig, extend);
    vig = 1.0 - vig;

    // mix chroma with original image by the gradient (more on corners, less in center)
    chroma = mix(og_color, chroma, vig * 2.);
    
	// mix chroma with vignette (darker version of chroma image)
    ALBEDO = mix(chroma, chroma * vec3(light), vig);
}