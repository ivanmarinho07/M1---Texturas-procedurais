Shader "Custom/J"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Blue ("Blue", Color) = (0,0,1,1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float4 _Blue;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //calcula a distância de cada ponto até o centro.
            float2 centro = uv - 0.5;
            float distancia = length(centro);

            //deixa azul os pontos que estão dentro do raio do círculo.
            float c = 1.0 - step(0.25, distancia);

            o.Albedo = lerp(float3(1,1,1), _Blue.rgb, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}