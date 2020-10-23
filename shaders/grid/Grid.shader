//@TheGreatMasterJ

//Procedural grid shader

shader_type spatial;
render_mode blend_mix, depth_draw_alpha_prepass;

uniform vec4 grid_color : hint_color = vec4(vec3(0.0),1.0);
uniform vec4 background_color : hint_color = vec4(vec3(0.0),0.0);

uniform vec4 emission_color : hint_color = vec4(vec3(0.0),1.0);
uniform float emission_strength : hint_range(0.0, 10.0) = 1.0;

uniform float line_thickness : hint_range(0.001, 0.5) = 0.01;
uniform int cell_count = 10;

void fragment()
{
    float x = fract(UV.x * float(cell_count));
    x = min(x, 1.0 - x);
    x = smoothstep(x - fwidth(x), x + fwidth(x), line_thickness);

    float y = fract(UV.y * float(cell_count));
    y = min(y, 1.0 - y);
    y = smoothstep(y - fwidth(y), y + fwidth(y), line_thickness);

    float grid = clamp(x + y, 0.0, 1.0);

	vec4 color = mix(background_color, grid_color, grid);
	
	ALBEDO = color.rgb;
	EMISSION = emission_color.rgb * emission_strength * color.a;
    ALPHA = color.a;
}
