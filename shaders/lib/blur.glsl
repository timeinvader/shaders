const float WEIGHT[5] = float[] (0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

//tex - texture, uv - pixel coord, offset - blur direction
vec3 GaussianBlur(sampler2D tex,vec2 uv, vec2 offset){

    vec3 result = texture2D(tex, uv).rgb * WEIGHT[0];
   for(int i = 1; i < 3; ++i)
        {   vec2 shift = offset * float(i);
            result += texture2D(tex, uv + shift).rgb * WEIGHT[i];
            result += texture2D(tex, uv - shift).rgb * WEIGHT[i];
        }
    return result;
}
