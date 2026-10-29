#version 120

varying vec2 texcoord;
varying vec4 color;
varying vec2 lmcoord;

uniform sampler2D texture;

void main() {
    /* DRAWBUFFERS:04 */
    gl_FragData[0] = color; // gcolor
    gl_FragData[1] = vec4(0.0, 0.0, 0.0,0.0); // gaux1
}