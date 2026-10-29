#version 120

varying vec2 texcoord;
varying vec4 color;
varying vec2 lmcoord;

uniform sampler2D texture;
uniform sampler2D lightmap;

void main(){
    vec2 lm = lmcoord;
    float blockLight = lm.x;
    float skyLight = lm.y;

    vec4 tex = texture2D(texture, texcoord.st);
    /* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(tex * color); //gcolor
}
