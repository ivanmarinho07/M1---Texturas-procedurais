Shader "Custom/L"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Linhas ("Quantidade de Linhas", Range(1, 20)) = 8
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float _Linhas;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //calcula a distância de cada ponto até o centro
            float2 centro = uv - 0.5;
            float distancia = length(centro);

            //repete a distância e cria círculos
            float c = frac(distancia * _Linhas);

            //transforma a repetição em linhas claras e escuras
            c = step(0.5, c);

            o.Albedo = float3(c, c, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}