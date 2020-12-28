#include <metal_stdlib>
using namespace metal;

//struct VertexIn {
//  float3 position [[ attribute(0) ]];
//  float4 color [[ attribute(1) ]];
//};
//
//vertex float4 vertex_main(const VertexIn vertexIn [[ stage_in ]],
//                          constant float &timer [[ buffer(1) ]]) {
//  float4 position = float4(vertexIn.position, 0);
//  position.y += timer;
//  return position;
//}

vertex float4 vertex_main(device float3 *vertices [[ buffer(0) ]], uint vertexID [[ vertex_id ]]) {
    return float4(vertices[vertexID], 1);
}

fragment float4 fragment_main() {
  return float4(1, 0, 0, 1);
}
