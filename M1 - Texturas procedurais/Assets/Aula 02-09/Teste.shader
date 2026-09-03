Shader "Custom/Teste"
{
    Properties
 {
     _Slider("Slider", Range(0,3)) = 0.5
     _Color1 ("Color", Color) = (1,1,1,1)
     _Color2 ("Color", Color) = (1,1,1,1)
     _MainTex("Texture", 2D) = "white" {}
 }

 SubShader
 {
     CGPROGRAM
     #pragma surface surf Standard fullforwardshadows alpha:blend
     #pragma target 3.0

     sampler2D _MainTex;
     float _Slider;
     struct Input
     {
         float2 uv_MainTex;
     };

     fixed4 _Color1, _Color2;

     void surf (Input IN, inout SurfaceOutputStandard o)
     {
         float2 uv = IN.uv_MainTex;
         fixed4 c = tex2D (_MainTex, IN.uv_MainTex);
         //o.Albedo = o.Normal.y * _Color1 + o.Normal.x * c;
         float f = sin(uv.x * 65) * 0.5 + 0.5;
         o.Albedo = 0;
         o.Alpha = f;
         o.Emission = _Color1 * f; 

     }
     ENDCG
 }
  FallBack "Diffuse"
}
