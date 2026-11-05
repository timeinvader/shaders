#version 120

#define BLOOM_STRENGTH 1.0 //[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.2 1.5 2.0 3.0 5.0]
#define VIGNETTE

uniform sampler2D gcolor;
uniform sampler2D gnormal;

uniform sampler2D depthtex0;
uniform float near;
uniform float far;
uniform vec3 fogColor;

const float FOGDENSITY = 0.04;
varying vec2 texcoord;

float getDistanceInBlocks(vec2 coord) {
    float depth = texture2D(depthtex0, coord).r;
    float ndc = depth * 2.0 - 1.0;
    return (2.0 * 0.05 * 256.0) / (256.0 + 0.05 - ndc * (256.0 - 0.05));
    }
vec3 screen(vec3 a, vec3 b) {
    return 1.0 - (1.0 - a) * (1.0 - b);
    }

void main() {
    vec3 worldColor = texture2D(gcolor, texcoord).rgb;

    //bloom
    vec3 bloomColor = texture2D(gnormal, texcoord).rgb;
    bloomColor *= BLOOM_STRENGTH;
    vec3 BloomColor = screen(worldColor, bloomColor);
    //fog
    float distance = getDistanceInBlocks(texcoord);
    float fogFactor = 1.0 - exp(-FOGDENSITY * (distance-32));
    if (distance > 255.0){
        fogFactor = 0.0; }
    fogFactor = clamp(fogFactor, 0.0, 1.0);
    //final
    vec3 finalColor = mix(BloomColor, fogColor, fogFactor);

    #ifdef VIGNETTE
    vec2 uv = texcoord * 2.0 - 1.0;
    float dist = length(uv);
    float vignette = smoothstep(1.0, 0.25, dist*0.59);
    finalColor *= vignette;
    #endif
    gl_FragColor = vec4(finalColor, 1.0);  //output
}
