//
//  Shaders.metal
//  MetalGameMultiPlatform
//
//  Created by Denys on 07.07.2023.
//

// File for Metal kernel and shader functions

#include <metal_stdlib>
#include <simd/simd.h>

// Including header shared between this Metal shader code and Swift/C code executing Metal API commands
#import "ShaderTypes.h"

using namespace metal;

struct VertexIn{
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

struct RasterizerData{
    float4 position [[ position ]];
    float4 color;
};

struct ModelConstants{
    float4x4 modelMatrix;
};

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant ModelConstants &modelConstants [[ buffer(1) ]]) {
    RasterizerData rd;
    
    rd.position = modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]]) {
    float4 color = rd.color;
    
    return half4(color.r, color.g, color.b, color.a);
}
