Shader "Custom/F"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Intensidade ("Intensidade", Range(1, 20)) = 8
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float _Intensidade;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            // Calcula a distância do ponto até o centro
            float2 centro = uv - 0.5;
            float distancia = dot(centro, centro);

            // A exponencial cria uma transição suave do branco no centro para o preto.
            float c = exp(-distancia * _Intensidade);

            o.Albedo = float3(c, c, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}