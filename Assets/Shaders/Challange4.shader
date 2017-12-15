Shader "brkyzdmr/Challange4" {
	Properties {
		_myDiffuse("Texture", 2D) = "white" {}
		_myNormal("Normal Map", 2D) = "bump" {}
		_myNormalAmount("Normal Amount", Range(0,10)) = 1
		_myBrightness("Brightness", Range(0,10)) = 1
	}
	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert
			
			sampler2D _myDiffuse;
			sampler2D _myNormal;
			half _myNormalAmount;
			half _myBrightness;

			struct Input {
				float2 uv_myDiffuse;
				float2 uv_myNormal;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse);
				o.Normal = UnpackNormal(tex2D(_myNormal, IN.uv_myNormal) * _myBrightness);
				o.Normal *= float3(_myNormalAmount, _myNormalAmount,1);
			}
		ENDCG
	}
	FallBack "Diffuse"
}