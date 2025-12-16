/* === Setup === */
precision highp float;

/* === Uniforms === */
uniform vec2 u_resolution;

/* === Constants === */
#define PI  3.1415926535
#define TAU 6.2831853071

/* === Settings === */
/* --- Anti-Aliasing --- */
#define SSAA 4 // Amount of samples to run. Severe performance impact

/* --- Generation --- */
#define ITERATIONS 6 // Amount of levels of perlin noise. Moderate performance impact
#define SEED 23400 // Seed to use for generation.

/* --- Rendering --- */
#define THICKNESS 0.01 // Thickness of the topology lines.
/* ~~~ Topology levels ~~~ */
// The height for each run of color.
#define L0 0.1
#define L1 0.2
#define L2 0.3
#define L3 0.4
#define L4 0.5
#define L5 0.6
#define L6 0.7
#define L7 0.8
#define L8 0.9
#define L9 1.0
#define LA 1.1
#define LB 1.2
/* ~~~ Colors ~~~ */
// C0 is the lowest rung and CB is the highest. C_ is the background.
#define C0 vec3(0.96, 0.76, 0.91)
#define C1 vec3(0.80, 0.65, 0.97)
#define C2 vec3(0.71, 0.75, 1.00)
#define C3 vec3(0.54, 0.71, 0.98)
#define C4 vec3(0.45, 0.78, 0.93)
#define C5 vec3(0.54, 0.86, 0.92)
#define C6 vec3(0.58, 0.89, 0.84)
#define C7 vec3(0.65, 0.89, 0.63)
#define C8 vec3(0.98, 0.89, 0.69)
#define C9 vec3(0.98, 0.70, 0.53)
#define CB vec3(0.95, 0.55, 0.66)
#define CA vec3(0.92, 0.63, 0.67)
#define C_ vec3(0.12, 0.12, 0.18)


/* === Random Number Generation === */
#define RNG int
float rand(inout RNG rng) {
	int a = 1103515245;
	int b = 1013904223;
	int c = 56653425;
	float m = 2147483647.;
	rng = a * rng*rng + b * rng + c;

	return mod(float(rng) / m, 1.);
}

/* === Noise === */
vec2 fade(vec2 t) {return t*t*t*(t*(t*6.0-15.0)+10.0);}
vec4 permute(vec4 x){return mod(((x*34.0)+1.0)*x, 289.0);}
float perlin( inout RNG rng, vec2 P ){
	vec4 Pi = floor(P.xyxy) + vec4(0.0, 0.0, 1.0, 1.0);
	vec4 Pf = fract(P.xyxy) - vec4(0.0, 0.0, 1.0, 1.0);
	Pi = mod(Pi,528.0 + 2.0 * rand(rng)); // To avoid truncation effects in permutation
	vec4 ix = Pi.xzxz;
	vec4 iy = Pi.yyww;
	vec4 fx = Pf.xzxz;
	vec4 fy = Pf.yyww;
	vec4 i = permute(permute(ix) + iy);
	vec4 gx = 2.0 * fract(i * rand(rng)) - 1.0; // 1/41 = 0.024...
	vec4 gy = abs(gx) - 0.5;
	vec4 tx = floor(gx + 0.5);
	gx = gx - tx;
	vec2 g00 = vec2(gx.x,gy.x);
	vec2 g10 = vec2(gx.y,gy.y);
	vec2 g01 = vec2(gx.z,gy.z);
	vec2 g11 = vec2(gx.w,gy.w);
	vec4 norm = 1.79284291400159 - 0.95373472095314 *
		vec4(dot(g00, g00), dot(g01, g01), dot(g10, g10), dot(g11, g11));
	g00 *= norm.x;
	g01 *= norm.y;
	g10 *= norm.z;
	g11 *= norm.w;
	float n00 = dot(g00, vec2(fx.x, fy.x));
	float n10  = dot(g10, vec2(fx.y, fy.y));
	float n01 = dot(g01, vec2(fx.z, fy.z));
	float n11 = dot(g11, vec2(fx.w, fy.w));
	vec2 fade_xy = fade(Pf.xy);
	vec2 n_x = mix(vec2(n00, n01), vec2(n10, n11), fade_xy.x);
	float n_xy = mix(n_x.x, n_x.y, fade_xy.y);
	return 2.3 * n_xy;
}

/* --- Fractal Noise --- */
// Generates Perlin noise with a scale and offset
float noise( inout RNG rng, vec2 p, float scale, vec2 offset ) {
	offset += vec2(rand(rng), rand(rng));
	return perlin(rng, (p + offset) * scale*10.);
}

// Generates repetitive fractal noise
float fractal_noise( inout RNG rng, vec2 p ) {
	float value = 0.;
	for ( int i=0; i < ITERATIONS; i++ ) {
		float amp = pow(0.5, float(i));
		float freq = pow(2., float(i));
		value += amp * (noise(rng, p, freq, vec2(0.)));
	}
	return value;
}

/* === Rendering === */
// Returns true if `x` is between `lo` and `hi`
bool between( float x, float lo, float hi ) {
	return (lo < x) && (x < hi);
}

// Corrects the height to a more appealing level
float height_correct( float height ) {
	return ((height + 1.0) / 2.0) * 1.175;
}

// Colors the height
vec3 color( float height ) {
	bool condition = false;
	if ( between(height, L0-THICKNESS, L0) ) {
		return C0;
	} else if ( between(height, L1-THICKNESS, L1) ) {
		return C1;
	} else if ( between(height, L2-THICKNESS, L2) ) {
		return C2;
	} else if ( between(height, L3-THICKNESS, L3) ) {
		return C3;
	} else if ( between(height, L4-THICKNESS, L4) ) {
		return C4;
	} else if ( between(height, L5-THICKNESS, L5) ) {
		return C5;
	} else if ( between(height, L6-THICKNESS, L6) ) {
		return C6;
	} else if ( between(height, L7-THICKNESS, L7) ) {
		return C7;
	} else if ( between(height, L8-THICKNESS, L8) ) {
		return C8;
	} else if ( between(height, L9-THICKNESS, L9) ) {
		return C9;
	} else if ( between(height, LA-THICKNESS, LA) ) {
		return CA;
	} else if ( between(height, LB-THICKNESS, LB) ) {
		return CB;
	} else {
		return C_;
	}
}

/* === Output === */
void mainImage( in vec4 fragCoord, out vec4 fragColor ) {
	vec2 uv = (2.*fragCoord.xy - u_resolution.xy)/u_resolution.y;
	uv /= 10.;

	RNG rng = SEED;
	float noise = fractal_noise(rng, uv);
	float height = height_correct(noise);
	vec3 col = color(height);
	fragColor = vec4(col, 1.);
}

void main( ) {
	RNG rng = SEED;
	vec4 finalColor = vec4(0.0);

#ifdef SSAA
	for (int _=0; _ < SSAA; _++) {
		float xOffset = (rand(rng) - 0.5);
		float yOffset = (rand(rng) - 0.5);
		vec4 offset = vec4(xOffset, yOffset, 0.0,0.0);
		vec4 color;
		mainImage(gl_FragCoord+offset, color);
		finalColor += color;
	}
	finalColor /= float(SSAA);
#else
	mainImage(finalColor, gl_FragColor);
#endif

	gl_FragColor = finalColor;
}