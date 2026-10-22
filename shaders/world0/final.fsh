#version 120 core

uniform float pixelSizeY;
uniform float viewHeight;
uniform sampler2D composite; //output fr previous stage
uniform sampler2D gcolor;

varying vec2 texcoord;


void main() {
    gl_FragColor = texture2D(gcolor, texcoord); //output
}
