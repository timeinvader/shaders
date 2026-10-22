#version 120 core

varying vec2 lmcoord;
varying vec3 glcolor;

void main(){
    /* DRAWBUFFERS:04 */
	gl_FragData[0] = vec4(glcolor, 1.0); //gcolor
}