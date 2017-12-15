Shader "brkyzdmr/FirstShader" {
	Properties {
		_myColor("Color", Color) = (1, 1, 1, 1)
		_myRange("Color Range", Range(0,5)) = 1
		_myTex("Texture", 2D) = "white"{}		
		_myCube("Cube", CUBE) = "" {}
	}
	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert
			struct Input {
				float2 uv_myTex;
				float3 worldRefl;
			};

			fixed4 _myColor;
			fixed3 _myEmission;
			half _myRange;
			sampler2D _myTex;
			samplerCUBE _myCube;

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = (tex2D(_myTex, IN.uv_myTex) * _myRange + _myColor).rgb;
				o.Emission = texCUBE(_myCube, IN.worldRefl);
			}
		ENDCG
	}
	FallBack "Diffuse"
}