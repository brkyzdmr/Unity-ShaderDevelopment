Shader "brkyzdmr/NormalShader" {
	Properties {
		_Nx("X", Range(-10,10)) = 1
		_Ny("Y", Range(-10,10)) = 1
		_Nz("Z", Range(-10,10)) = 1
	}
	SubShader {
		CGPROGRAM
			#pragma surface surf Lambert

			half _Nx;
			half _Ny;
			half _Nz;

			struct Input {
				float2 uv_Diffuse;
			};

			void surf(Input IN, inout SurfaceOutput o) {
				o.Albedo = 1;
				o.Normal = float3(_Nx, _Ny, _Nz);
			}
		ENDCG		
	}
	FallBack "Diffuse"
}