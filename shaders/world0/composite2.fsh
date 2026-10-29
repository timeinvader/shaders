#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gnormal; //light buffer
uniform float viewHeight;  

varying vec2 texcoord;

#include "../lib/blur.glsl"

void main(){
    vec2 offset = vec2(0.0, 1.0 / viewHeight); //get size one pixel, Y
    vec3 result = GaussianBlur(gnormal, texcoord, offset);

    /* DRAWBUFFERS:2 */
    gl_FragData[0] = vec4(result, 1.0); //gnormal
}
