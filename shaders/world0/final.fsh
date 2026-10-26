#version 120

uniform sampler2D gcolor;
uniform sampler2D gnormal;

varying vec2 texcoord;

vec3 screen(vec3 a, vec3 b) {
    return 1.0 - (1.0 - a) * (1.0 - b);
    }

void main() {
    vec3 worldColor = texture2D(gcolor, texcoord).rgb;
    vec3 bloomColor = texture2D(gnormal, texcoord).rgb;

    bloomColor *= 1.9;

    vec3 finalColor = screen(worldColor, bloomColor);

    gl_FragColor = vec4(finalColor, 1.0);  //output
}
