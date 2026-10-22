#version 120

varying vec2 texcoord;
varying vec2 lmcoord; //light
varying vec4 vertexColor; //amb occl

uniform sampler2D texture; 
uniform sampler2D lightmap; 

void main() {
    vec4 blockColor = texture2D(texture, texcoord.st);
    vec4 lightColor = texture2D(lightmap, lmcoord);
    vec3 darkAO = pow(vertexColor.rgb, vec3(2.0));
    vec3 finalColor = blockColor.rgb * lightColor.rgb * darkAO;

    /* DRAWBUFFERS:01 */
    gl_FragData[0] = vec4(finalColor, blockColor.a);  //gcolor
    gl_FragData[1] = vec4(lmcoord, 1.0, 1.0); // gaux1
}