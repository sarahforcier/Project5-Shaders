
uniform sampler2D tDiffuse;
uniform float resolution;
uniform float pixels;
varying vec2 f_uv;

void main() {
	float step = 1.0/resolution;
    vec4 col0 = texture2D(tDiffuse, f_uv);
    vec4 col_1 = texture2D(tDiffuse, vec2(clamp(f_uv.x - step*pixels,0.0,1.0), f_uv.y));
    vec4 col_2 = texture2D(tDiffuse, vec2(clamp(f_uv.x - 2.0*step*pixels,0.0,1.0), f_uv.y));
    vec4 col1 = texture2D(tDiffuse, vec2(clamp(f_uv.x + step*pixels,0.0,1.0), f_uv.y));
    vec4 col2 = texture2D(tDiffuse, vec2(clamp(f_uv.x + 2.0*step*pixels,0.0,1.0), f_uv.y));
    vec3 color = 0.06136*col_2.rgb + 
    			0.24477*col_1.rgb +
    			0.38774*col0.rgb +
    			0.24477*col1.rgb + 
    			0.06136*col2.rgb;
    gl_FragColor = vec4(color, 1.0);
}   
