Shader "Custom/E"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Intensidade ("Intensidade", Range(1, 20)) = 8
        _Repeticoes ("Repetições", Range(1, 10)) = 3
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float _Intensidade;
        float _Repeticoes;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            // Cria as repetições da bolinha 
            uv = frac(uv * _Repeticoes);

            // Calcula a distância do ponto até o centro de cada repetição.
            float2 centro = uv - 0.5;
            float distancia = dot(centro, centro);

            // A exponencial cria a mesma mancha suave do Shader F.
            float c = exp(-distancia * _Intensidade);

            o.Albedo = float3(c, c, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}