Shader "Custom/SplitPixel" {
        Properties {
        _MainTex ("Source", 2D) = "white" {}
        _Size ("Size", int) = 1
    }
    SubShader {
        Pass{
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            
            #include "UnityCG.cginc"

            struct v2f {
                float4 pos : SV_POSITION;
                float2 uv : TEXCOORD0;
            };

            v2f vert(appdata_img v) {
                v2f o;
                o.pos = UnityObjectToClipPos(v.vertex);
                o.uv = MultiplyUV(UNITY_MATRIX_TEXTURE0, v.texcoord.xy);
                return o;
            }

            sampler2D _MainTex;
            float _Size;
            fixed4 frag(v2f i) : SV_TARGET {
				float u = i.uv.x;
				float v = i.uv.y;
				float interval = 1.0 / _Size;
				int x = u / interval;
				int y = v / interval;
				u = (interval * x) + (interval * (x + 1)) - u;
				v = (interval * y) + (interval * (y + 1)) - v;
				return tex2D(_MainTex, float2(u, v));
            }
            ENDCG
        }
    }
    FallBack Off
}