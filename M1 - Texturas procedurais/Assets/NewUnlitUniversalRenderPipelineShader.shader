Shader "Custom/NewUnlitUniversalRenderPipelineShader"
{
        Properties {
     _Color ("Color", Color) = (1,1,1,1)
     _MainTex ("Albedo (RGB)", 2D) = "white" {}
     _Slider ("Slider", Range (-2, 2)) = 0
     _Slider2 ("Slider", Range (2, -2)) = 0
 }
 SubShader {
     CGPROGRAM
     #pragma surface surf Standard fullforwardshadows
     sampler2D _MainTex;
     struct Input {
         float2 uv_MainTex;
     };
     fixed4 _Color;
     float _Slider;
     float 2 _Slider2;
     void surf (Input IN, inout SurfaceOutputStandard o) {
         fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;
         float 2 uv = IN.uv_MainTex;
         float f = saturate(uv.x - uv.y);
         o.Albedo = sin(f + _Slider);
     }
     ENDCG
 }
 FallBack "Diffuse"
}
