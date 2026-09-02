Shader "Custom/I"
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

            //cria os limites do quadrado central.
            float x = step(0.25, uv.x) * step(uv.x, 0.75);
            float y = step(0.25, uv.y) * step(uv.y, 0.75);

            //multiplica X e Y para deixar azul apenas dentro do quadrado.
            float c = x * y;

            o.Albedo = lerp(float3(1,1,1), _Blue.rgb, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}