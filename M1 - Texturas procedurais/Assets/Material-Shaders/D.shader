Shader "Custom/D"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Listras ("Quantidade de Listras", Range(5, 50)) = 35
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float _Listras;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            // Subtração de X e Y para criar a diagonal das listras e multiplicação aumenta ou diminui a quantidade de listras.
            float c = sin((uv.x - uv.y) * _Listras);

            // Transformação dos valores pra criar a repetição das listras
            c = abs(c);

            o.Albedo = float3(c, c, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}