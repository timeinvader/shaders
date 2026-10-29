#version 120

#define BLOOM_STRENGTH 1.0 //[0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0 1.2 1.5 2.0 3.0 5.0]

uniform sampler2D gcolor;
uniform sampler2D gnormal;

varying vec2 texcoord;

vec3 screen(vec3 a, vec3 b) {
    return 1.0 - (1.0 - a) * (1.0 - b);
    }

void main() {
    vec3 worldColor = texture2D(gcolor, texcoord).rgb;
    vec3 bloomColor = texture2D(gnormal, texcoord).rgb;

    bloomColor *= BLOOM_STRENGTH;;

    vec3 finalColor = screen(worldColor, bloomColor);

    gl_FragColor = vec4(finalColor, 1.0);  //output
}
