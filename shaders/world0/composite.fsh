#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gaux1; // light buffer

varying vec2 texcoord;

void main() {
    vec3 color = texture2D(gcolor, texcoord).rgb;

    float brightness = max(color.r, max(color.g, color.b)); // lum
    vec3 bloomMask = (brightness > 0.8) ? color : vec3(0.0);     // 
    /* DRAWBUFFERS:1 */
    gl_FragData[1] = vec4(bloomMask, 1.0); 
}