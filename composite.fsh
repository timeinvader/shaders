#version 330 compatibility

uniform sampler2D colortex0;  // сцена
uniform sampler2D colortex1; // буфер ярких пикселей

/* DRAWBUFFERS:1 */
void main() {
    color = texture(colortex0, texcoord);
    float lum = dot(color.rgb,vec3(0.2126, 0.7152, 0.0722))
    if (lum > 0.9) {

    }
}

