
Shader "brkyzdmr/Challange3" {
	Properties {
		_Tex("Texture", 2D) = "white" {}
	}

	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert
			struct Input {
				float2 uv_Tex;
			};

			sampler2D _Tex;

			void surf(Input IN, inout SurfaceOutput o) {
				float4 green = float4(0,1,0,1);
				o.Albedo = (tex2D(_Tex, IN.uv_Tex) * green).rgb;
			}

		ENDCG
	}
	FallBack "Diffuse"
}