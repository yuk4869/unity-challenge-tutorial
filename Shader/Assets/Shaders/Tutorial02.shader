﻿Shader "UnityEngineChallenge/ShaderTutorial/Tutorial02"
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



            v2f vert(appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                float4 c = tex2D(_MainTex, i.uv);
                /* YOUR ANSWER HERE */

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
