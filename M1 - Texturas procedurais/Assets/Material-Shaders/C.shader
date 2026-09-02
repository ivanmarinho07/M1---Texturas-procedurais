Shader "Custom/C"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //X e Y são usados para misturar as cores
            float r = saturate(uv.x + 1.0 - uv.y); //Soma x e y + 1 para chegar no magenta
            float g = saturate(uv.x + uv.y); //Soma x + y até o verde chegar no branco
            float b = 1.0; //Mantém azul para chegar no ciano

            o.Albedo = float3(r, g, b);
        }
        ENDCG
    }

    FallBack "Diffuse"
}