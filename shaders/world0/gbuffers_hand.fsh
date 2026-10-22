#version 120

varying vec2 texcoord;
varying vec4 color;
varying vec2 lmcoord;

uniform sampler2D texture;

void main() {
    vec4 entityColor = texture2D(texture, texcoord) * color;

    /* DRAWBUFFERS:04 */
    gl_FragData[0] = entityColor;             // gcolor 
    gl_FragData[1] = vec4(lmcoord, 1.0, 1.0); // gaux1
}