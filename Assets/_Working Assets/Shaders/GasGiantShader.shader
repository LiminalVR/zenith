// Shader created with Shader Forge v1.38 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4730,x:32719,y:32712,varname:node_4730,prsc:2|diff-5054-RGB;n:type:ShaderForge.SFN_Tex2d,id:5054,x:32378,y:32888,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:node_5054,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ad2d95b8412f871418cff16114d6cc5d,ntxv:0,isnm:False|UVIN-2771-OUT;n:type:ShaderForge.SFN_Panner,id:4899,x:31741,y:32804,varname:node_4899,prsc:2,spu:1,spv:0|UVIN-4594-UVOUT,DIST-7547-OUT;n:type:ShaderForge.SFN_Time,id:675,x:31412,y:33112,varname:node_675,prsc:2;n:type:ShaderForge.SFN_Slider,id:1726,x:31227,y:32902,ptovrint:False,ptlb:PanSpeed,ptin:_PanSpeed,varname:node_1726,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Multiply,id:7547,x:31552,y:32963,varname:node_7547,prsc:2|A-1726-OUT,B-675-T;n:type:ShaderForge.SFN_TexCoord,id:4594,x:31541,y:32774,varname:node_4594,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:7933,x:31929,y:32888,ptovrint:False,ptlb:NoiseTex,ptin:_NoiseTex,varname:node_7933,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-4899-UVOUT;n:type:ShaderForge.SFN_Lerp,id:2771,x:32162,y:32888,varname:node_2771,prsc:2|A-4360-UVOUT,B-7933-R,T-8426-OUT;n:type:ShaderForge.SFN_Slider,id:8426,x:31741,y:33088,ptovrint:False,ptlb:DistortStrength,ptin:_DistortStrength,varname:_node_1726_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_TexCoord,id:8955,x:31824,y:32242,varname:node_8955,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:5639,x:31746,y:32458,varname:node_5639,prsc:2|A-388-OUT,B-3946-T;n:type:ShaderForge.SFN_Time,id:3946,x:31521,y:32604,varname:node_3946,prsc:2;n:type:ShaderForge.SFN_Slider,id:388,x:31415,y:32367,ptovrint:False,ptlb:MainTexSpeed,ptin:_MainTexSpeed,varname:_PanSpeed_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0,max:1;n:type:ShaderForge.SFN_Panner,id:4360,x:31980,y:32399,varname:node_4360,prsc:2,spu:1,spv:0|UVIN-8955-UVOUT,DIST-5639-OUT;proporder:5054-388-7933-1726-8426;pass:END;sub:END;*/

Shader "Planets/Gas Giant Shader" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _MainTexSpeed ("MainTexSpeed", Range(-1, 1)) = 0
        _NoiseTex ("NoiseTex", 2D) = "white" {}
        _PanSpeed ("PanSpeed", Range(0, 1)) = 0
        _DistortStrength ("DistortStrength", Range(0, 1)) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        LOD 200
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _PanSpeed;
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            uniform float _DistortStrength;
            uniform float _MainTexSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float3 indirectDiffuse = float3(0,0,0);
                indirectDiffuse += UNITY_LIGHTMODEL_AMBIENT.rgb; // Ambient Light
                float4 node_3946 = _Time;
                float4 node_675 = _Time;
                float2 node_4899 = (i.uv0+(_PanSpeed*node_675.g)*float2(1,0));
                float4 _NoiseTex_var = tex2D(_NoiseTex,TRANSFORM_TEX(node_4899, _NoiseTex));
                float2 node_2771 = lerp((i.uv0+(_MainTexSpeed*node_3946.g)*float2(1,0)),float2(_NoiseTex_var.r,_NoiseTex_var.r),_DistortStrength);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2771, _MainTex));
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = (directDiffuse + indirectDiffuse) * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _PanSpeed;
            uniform sampler2D _NoiseTex; uniform float4 _NoiseTex_ST;
            uniform float _DistortStrength;
            uniform float _MainTexSpeed;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
                UNITY_FOG_COORDS(5)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
/////// Diffuse:
                float NdotL = max(0.0,dot( normalDirection, lightDirection ));
                float3 directDiffuse = max( 0.0, NdotL) * attenColor;
                float4 node_3946 = _Time;
                float4 node_675 = _Time;
                float2 node_4899 = (i.uv0+(_PanSpeed*node_675.g)*float2(1,0));
                float4 _NoiseTex_var = tex2D(_NoiseTex,TRANSFORM_TEX(node_4899, _NoiseTex));
                float2 node_2771 = lerp((i.uv0+(_MainTexSpeed*node_3946.g)*float2(1,0)),float2(_NoiseTex_var.r,_NoiseTex_var.r),_DistortStrength);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(node_2771, _MainTex));
                float3 diffuseColor = _MainTex_var.rgb;
                float3 diffuse = directDiffuse * diffuseColor;
/// Final Color:
                float3 finalColor = diffuse;
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
