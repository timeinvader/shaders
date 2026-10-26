#version 120

uniform sampler2D gcolor; //main color
uniform sampler2D gaux1; // light buffer

varying vec2 texcoord;

void main() {
    vec3 color = texture2D(gcolor, texcoord).rgb;
    vec4 blocklight = texture2D(gaux1,texcoord).rgba;

    float brightness = max(color.r, max(color.g, color.b)); // lum
    float colormax = max(color.r, max(color.g, color.b));
    float colormin = min(color.r, min(color.g, color.b));
    float saturation  = colormax - colormin;

    vec3 bloomMask = vec3(0.0);
    if (brightness > 0.75  && blocklight.r > 0.75) {
        bloomMask = color;
        }
    else {
        bloomMask = vec3(0.0, 0.0, 0.0);
    }

    /* DRAWBUFFERS:2 */
    gl_FragData[0] = vec4(bloomMask, 1.0); //gnormal
}

