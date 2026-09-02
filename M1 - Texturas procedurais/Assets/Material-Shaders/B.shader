Shader "Custom/B"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _RedColor ("Red", Color) = (1,0,0,1)
        _BlueColor ("Blue", Color) = (0,0,1,1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float4 _RedColor;
        float4 _BlueColor;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //soma das coordenadas cria a direção diagonal
            float diagonal = uv.x - uv.y;

            //deixa o centro da diagonal mais próximo de 1
            float c = 1.0 - abs(diagonal);

            //mistura o azul e o vermelho de acordo com a distância da diagonal
            o.Albedo = lerp(float3(0, 0, 1), float3(1, 0, 0), c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}