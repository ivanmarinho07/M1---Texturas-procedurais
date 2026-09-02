Shader "Custom/K"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Blue ("Blue", Color) = (0,0,1,1)
        _Listras ("Quantidade de Listras", Range(1, 20)) = 4
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float4 _Blue;
        float _Listras;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //multiplica X para repetir o padrão e cria as listras verticais.
            float c = frac(uv.x * _Listras);

            //alterna entre azul e branco.
            c = step(0.5, c);

            o.Albedo = lerp(float3(1,1,1), _Blue.rgb, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}