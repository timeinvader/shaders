#version 120

varying vec2 texcoord;
varying vec2 lmcoord; //light
varying vec4 vertexColor; //amb occl

uniform mat4 gbufferModelView;

void main() {
    gl_Position = ftransform();
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    vertexColor = gl_Color;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;

}
