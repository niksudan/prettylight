varying vec2 v_texcoord;

uniform float time;
uniform vec2 mouse_pos;
uniform vec2 resolution;

void main()
{ 
float blurSize = 1.0/resolution.y;

   vec4 sum = vec4(0.0);
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y- 4.0*blurSize)) * 0.05;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y- 3.0*blurSize)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - 2.0*blurSize)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y - blurSize)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y)) * 0.16;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + blurSize)) * 0.15;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 2.0*blurSize)) * 0.12;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 3.0*blurSize)) * 0.09;
   sum += texture2D(gm_BaseTexture, vec2(v_texcoord.x, v_texcoord.y + 4.0*blurSize)) * 0.05;
   gl_FragColor = sum;
}
