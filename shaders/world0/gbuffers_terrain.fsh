#version 120

varying vec2 texcoord;
varying vec2 lmcoord; //light
varying vec3 vertexColor; //amb occl
varying float fogFactor;

uniform sampler2D gcolor;
uniform sampler2D texture;
uniform sampler2D lightmap;
uniform vec3 fogColor;

void main() {
    vec4 tex = texture2D(texture, texcoord);
    if (tex.a < 0.1) discard;
    vec2 lm = lmcoord;
    float blockLight = lm.x;
    float skyLight = lm.y;
    //light
    vec4 blockColor = texture2D(texture, texcoord.st);
    vec4 lightColor = texture2D(lightmap, lmcoord);
    blockLight = blockLight * mix(blockLight, 1.0, 0.7);
    blockLight = max(blockLight - skyLight * 0.1, 0.0);
    blockLight = clamp(blockLight, 0.0, 1.0);
    // darker shadows
    vec3 darkAO = mix(vertexColor.rgb, vertexColor.rgb * vertexColor.rgb, 0.8);
    vec3 finalColor = blockColor.rgb * lightColor.rgb * darkAO;
    /* DRAWBUFFERS:045 */
    gl_FragData[0] = vec4(finalColor, blockColor.a);  //gcolor
    gl_FragData[1] = vec4(blockLight, 0.0, 0.0, 1.0); //gaux1
    gl_FragData[2] = blockColor; //gaux2
}
