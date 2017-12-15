Shader "brkyzdmr/Challange2" {
	Properties {
		_Color("Color", Color) = (1,1,1,1)
	}
	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert
			struct Input {
				float2 uv_Tex;
			};

			fixed4 _Color;

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo.rb = _Color.rb;
				o.Albedo.g = 1;
			}
		ENDCG
	}
	FallBack "Diffuse"
}