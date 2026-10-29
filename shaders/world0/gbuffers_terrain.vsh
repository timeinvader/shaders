#version 120

varying vec2 texcoord;
varying vec2 lmcoord; //light
varying vec3 vertexColor; //amb occl
varying float fogFactor;

uniform mat4 gbufferModelView;
uniform float fogEnd;

void main() {
    gl_Position = ftransform();
    texcoord = (gl_TextureMatrix[0] * gl_MultiTexCoord0).xy;
    vertexColor = gl_Color.rgb;
    lmcoord = (gl_TextureMatrix[1] * gl_MultiTexCoord1).xy;
    vec4 viewPos = gbufferModelView * gl_Vertex;
    float dist = -viewPos.z;
    fogFactor = smoothstep(5.0, fogEnd, dist);
}
