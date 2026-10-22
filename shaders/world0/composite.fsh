#version 120 core 

uniform sampler2D gcolor; //main color
uniform sampler2D depthtex0;   // depth
uniform sampler2D noisetex;   //noise

uniform float far;             // distance
uniform float viewWidth;       
uniform float viewHeight;     

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;
uniform vec3 cameraPosition;

uniform float pixelSizeX;
uniform float pixelSizeY;

varying vec2 texcoord;

void main() {
    vec3 color = texture2D(gcolor, texcoord).rgb;

    float brightness = max(color.r, max(color.g, color.b)); // lum
    vec3 bloomMask = (brightness > 0.8) ? color : vec3(0.0);     // 
    /* DRAWBUFFERS:0 */
    gl_FragData[0] = vec4(bloomMask, 1.0); 
}