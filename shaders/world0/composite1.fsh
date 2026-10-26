#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gnormal; //light buffer
uniform float viewWidth;  

const float WEIGHT[5] = float[] (0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

varying vec2 texcoord;

void main(){
   float texelSizeX = 1.0 / viewWidth; //get size one pixel

    vec3 result = texture2D(gnormal, texcoord).rgb * WEIGHT[0];
   
   for(int i = 1; i < 5; ++i)
        {
            result += texture2D(gnormal, texcoord + vec2(texelSizeX * i, 0.0)).rgb * WEIGHT[i];
            result += texture2D(gnormal, texcoord - vec2(texelSizeX * i, 0.0)).rgb * WEIGHT[i];
        }

    /* DRAWBUFFERS:2 */
    gl_FragData[0] = vec4(result, 1.0); //gnormal
}