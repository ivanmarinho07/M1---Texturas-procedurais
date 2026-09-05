Shader "Custom/Xadrez"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Quadros ("Quantidade de Quadros", Range(1, 20)) = 8
        _Velocidade ("Velocidade da Animacao", Range(0, 5)) = 1

        //cores pre-determinadas dos quadros claros
        _Clara1 ("Cor Clara 1", Color) = (0.4, 1, 0.4, 1)
        _Clara2 ("Cor Clara 2", Color) = (0.6, 0.6, 0.6, 1)

        //cores pre-determinadas dos quadros escuros
        _Escura1 ("Cor Escura 1", Color) = (0, 0, 0, 1)
        _Escura2 ("Cor Escura 2", Color) = (1, 0, 0, 1)
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows
        #pragma target 3.0

        sampler2D _MainTex;
        float _Quadros;
        float _Velocidade;
        float4 _Clara1;
        float4 _Clara2;
        float4 _Escura1;
        float4 _Escura2;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            float2 uv = IN.uv_MainTex;

            //repete o UV para criar a grade de quadros
            float2 grade = frac(uv * _Quadros);

            //transforma cada eixo em faixas claras e escuras
            float linha = step(0.5, grade.x);
            float coluna = step(0.5, grade.y);

            //combina as faixas em um xadrez (1 = quadro claro, 0 = quadro escuro)
            float c = abs(linha - coluna);

            //vai e volta entre 0 e 1 com o tempo para trocar as cores automaticamente
            float t = abs(frac(_Time.y * _Velocidade * 0.5) * 2.0 - 1.0);

            //interpola cada par de cores pre-determinadas
            float3 clara = lerp(_Clara1.rgb, _Clara2.rgb, t);
            float3 escura = lerp(_Escura1.rgb, _Escura2.rgb, t);

            //pinta o quadro com a cor clara ou escura do momento
            o.Albedo = lerp(escura, clara, c);
        }
        ENDCG
    }

    FallBack "Diffuse"
}
