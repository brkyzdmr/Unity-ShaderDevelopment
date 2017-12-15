Shader "brkyzdmr/Reflection" {
	Properties {
		_Diffuse("Diffuse", 2D) = "white" {}
		_Normal("Normal", 2D) = "bump" {}
		_NormalAmount("Normal Amount", Range(0, 10)) = 1
		_Brightness("Brightness", Range(0, 10)) = 1
		_Cube("Cube", CUBE) = "" {}
	}
	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert
			sampler2D _Diffuse;
			sampler2D _Normal;
			samplerCUBE  _Cube;
			half _NormalAmount;
			half _Brightness;

			struct Input {
				float2 uv_Diffuse;
				float2 uv_Normal;
				float3 worldRefl; INTERNAL_DATA
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_Diffuse, IN.uv_Diffuse).rgb;
				o.Normal = UnpackNormal(tex2D(_Normal, IN.uv_Normal) * _Brightness);
				o.Normal *= float3(_NormalAmount, _NormalAmount, 1);
				o.Emission = texCUBE(_Cube, WorldReflectionVector(IN, o.Normal)).rgb;
			}

		ENDCG
	}
	FallBack "Diffuse"
}