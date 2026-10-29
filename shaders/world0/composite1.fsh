#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gnormal; //light buffer
uniform float viewWidth;  

varying vec2 texcoord;

#include "../lib/blur.glsl"

void main(){
    vec2 offset = vec2(1.0 / viewWidth, 0.0); //get size one pixel, X
    vec3 result = GaussianBlur(gnormal, texcoord, offset);

    /* DRAWBUFFERS:2 */
    gl_FragData[0] = vec4(result, 1.0); //gnormal
}
