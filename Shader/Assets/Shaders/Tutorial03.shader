Shader "UnityEngineChallenge/ShaderTutorial/Tutorial03"
{
    Properties
    {
        [PerRendererData]
        _MainTex("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType" = "Opaque" }

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            //float4 _Time;

            v2f vert(appdata v)
            {
                /* YOUR ANSWER HERE */

                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.vertex.y += sin(v.vertex.x + _Time * 100);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float4 c = tex2D(_MainTex, i.uv);
                c.r = i.uv.x;
                c.g = i.uv.y;
                c.b = i.uv.x;
                c.a = 1.0;
                return c;
            }

            ENDCG
        }
    }
}
