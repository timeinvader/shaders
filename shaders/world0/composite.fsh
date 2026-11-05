#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gaux1; // light buffer
uniform sampler2D gaux2;

varying vec2 texcoord;

void main() {
    vec4 color = texture2D(gaux2, texcoord);
    vec4 blocklight = texture2D(gaux1,texcoord).rgba;
    float brightness = max(color.r, max(color.g, color.b)); // lum

    vec4 bloomMask = vec4(0.0);
    if (brightness > 0.8 && blocklight.r > 0.78) {
        bloomMask = vec4(color.rgb*0.8,color.a*0.1);
        }
    else {
        bloomMask = vec4(0.0);
    }

    /* DRAWBUFFERS:2 */
    gl_FragData[0] = bloomMask; //gnormal
}

