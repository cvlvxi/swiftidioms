#include <metal_stdlib>
using namespace metal;

struct VertexIn {
  float3 position;
  float4 color;
};

struct RasterizerData {
    float4 position [[ position ]];
    float4 color;
};

vertex RasterizerData vertex_main(device VertexIn *vertices [[ buffer(0) ]], uint vertexID [[ vertex_id ]]) {
    RasterizerData rd;
    rd.position = float4(vertices[vertexID].position, 1);
    rd.color = vertices[vertexID].color;
    return rd;
}

// Needs stage_in here
fragment float4 fragment_main(RasterizerData rd [[ stage_in ]]) {
    float4 color = rd.color;
    return float4(color.r, color.g, color.b, color.a);
}
