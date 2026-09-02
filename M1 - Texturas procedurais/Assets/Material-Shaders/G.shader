Shader "Custom/G"
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

            //divide a textura ao meio usando a posição X
            float c = step(0.5, uv.x);

            //mistura branco e azul de acordo com a divisão criada
            o.Albedo = lerp(float3(1,1,1), _Blue.rgb, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}