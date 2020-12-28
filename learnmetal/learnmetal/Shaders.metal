#include <metal_stdlib>
using namespace metal;

struct VertexIn {
  float3 position;
  float4 color;
};
//
//vertex float4 vertex_main(const VertexIn vertexIn [[ stage_in ]],
//                          constant float &timer [[ buffer(1) ]]) {
//  float4 position = float4(vertexIn.position, 0);
//  position.y += timer;
//  return position;
//}

vertex float4 vertex_main(device VertexIn *vertices [[ buffer(0) ]], uint vertexID [[ vertex_id ]]) {
    return float4(vertices[vertexID].position, 1);
}

fragment float4 fragment_main() {
  return float4(1, 0, 0, 1);
}
