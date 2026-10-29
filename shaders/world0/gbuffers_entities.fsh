#version 120

varying vec2 texcoord;
varying vec4 color;
varying vec2 lmcoord;

uniform sampler2D texture;
uniform sampler2D lightmap;

void main() {
    vec2 lm = lmcoord;
    float blockLight = lm.x;
    float skyLight = lm.y;

    vec4 blockColor = texture2D(texture, texcoord.st);

    blockLight = pow(blockLight, 1.5);
    blockLight = max(blockLight - skyLight * 0.1, 0.0);
    blockLight = clamp(blockLight, 0.0, 1.0);

    vec4 lightColor = texture2D(lightmap, lmcoord);

    vec3 finalColor = blockColor.rgb * lightColor.rgb;
    

    /* DRAWBUFFERS:04 */
    gl_FragData[0] = vec4(finalColor, blockColor.a);  //gcolor
    gl_FragData[1] = vec4(0.0, 0.0, 0.0, 0.0); // gaux1
}