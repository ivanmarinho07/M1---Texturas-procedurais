Shader "Custom/A"
{
    Properties
 {
     _MainTex ("Albedo (RGB)", 2D) = "white" {}
     _Inverter ("Inverter", Range(0, 1)) = 0
 }

 SubShader
 {
     CGPROGRAM
     #pragma surface surf Standard fullforwardshadows
     #pragma target 3.0

     sampler2D _MainTex;
     float _Inverter;

     struct Input
     {
         float2 uv_MainTex;
     };

     void surf (Input IN, inout SurfaceOutputStandard o)
     {
         float2 uv = IN.uv_MainTex;

         //cria o degradê horizontal do branco para o preto
         float c = 1.0 - uv.x;

         //inverte o degradê
         c = lerp(c, 1.0 - c, _Inverter);

         o.Albedo = float3(c, c, c);
     }
     ENDCG
 }
 FallBack "Diffuse"
}
