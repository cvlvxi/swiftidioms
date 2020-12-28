import MetalKit

struct Vertex {
    var position: SIMD3<Float>
    var color: SIMD4<Float>
}


class Renderer: NSObject {

    static var device: MTLDevice!
    static var commandQueue: MTLCommandQueue!
    var mesh: MTKMesh!
    var vertexBuffer: MTLBuffer!
    var vertexBuffer2: MTLBuffer!
    var pipelineState: MTLRenderPipelineState!
    var timer: Float = 0

    var vertices: [Vertex] = [
        Vertex(position: SIMD3<Float>(0,1,0), color: SIMD4<Float>(1,0,0,1)),
        Vertex(position: SIMD3<Float>(-1,-1,0), color: SIMD4<Float>(0,1,0,1)),
        Vertex(position: SIMD3<Float>(1,-1,0), color: SIMD4<Float>(0,0,1,1))
    ]
//    var vertices: [SIMD3<Float>] = [
//        SIMD3<Float>(0,1,0),
//        SIMD3<Float>(-1,-1,0),
//        SIMD3<Float>(1,-1,0)
//    ]
    

    init(metalView: MTKView) {
        guard let device = MTLCreateSystemDefaultDevice() else {
            fatalError("GPU not available")
        }
        metalView.device = device
        Renderer.device = device
        Renderer.commandQueue = device.makeCommandQueue()!
//
//        let mdlMesh = Primitive.cube(device: device, size: 1.0)
//        let mdlMesh = Primitive.sphere(device: device, size: 1.0)
//        mesh = try! MTKMesh(mesh: mdlMesh, device: device)
//        vertexBuffer = mesh.vertexBuffers[0].buffer
        self.vertexBuffer2 = Renderer.device.makeBuffer(bytes: vertices, length: MemoryLayout<Vertex>.stride * vertices.count,  options: [])
       

        let library = device.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "vertex_main")
        let fragmentFunction = library?.makeFunction(name: "fragment_main")

        let pipelineDescriptor = MTLRenderPipelineDescriptor()
        pipelineDescriptor.vertexFunction = vertexFunction
        pipelineDescriptor.fragmentFunction = fragmentFunction
//        pipelineDescriptor.vertexDescriptor = MTKMetalVertexDescriptorFromModelIO(mdlMesh.vertexDescriptor)
//        let vertexDescriptor = MTLVertexDescriptor()
//        vertexDescriptor.attributes[0].format = .float3
//        vertexDescriptor.attributes[0].bufferIndex = 0
//        vertexDescriptor.attributes[0].offset = 0
//        vertexDescriptor.attributes[1].format = .float4
//        vertexDescriptor.attributes[1].bufferIndex = 0
//        vertexDescriptor.attributes[1].offset = MemoryLayout<SIMD3<Float>>.stride
//        vertexDescriptor.layouts[0].stride = MemoryLayout<SIMD3<Float>>.stride + MemoryLayout<SIMD4<Float>>.stride
//        pipelineDescriptor.vertexDescriptor = vertexDescriptor
//
//
        
        pipelineDescriptor.colorAttachments[0].pixelFormat = metalView.colorPixelFormat

        // After doing setup stuff let's make render pipeline staate
        do {
            pipelineState = try device.makeRenderPipelineState(descriptor: pipelineDescriptor)
        } catch let error {
            fatalError(error.localizedDescription)
        }

        super.init()
        metalView.clearColor = MTLClearColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1)
        metalView.delegate = self

    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    }

    func draw(in view: MTKView) {
        guard let descriptor = view.currentRenderPassDescriptor,
              let commandBuffer = Renderer.commandQueue.makeCommandBuffer(),
              let renderEncoder =
              commandBuffer.makeRenderCommandEncoder(descriptor: descriptor) else {
            return
        }

        timer += 0.05
        var currentTime: Float = sin(timer)
        renderEncoder.setVertexBytes(&currentTime, length: MemoryLayout<Float>.stride, index: 1)

        renderEncoder.setRenderPipelineState(pipelineState)
        renderEncoder.setVertexBuffer(self.vertexBuffer2, offset: 0, index: 0)
//        for submesh in mesh.submeshes {
//            renderEncoder.drawIndexedPrimitives(type: .triangle,
//                    indexCount: submesh.indexCount,
//                    indexType: submesh.indexType,
//                    indexBuffer: submesh.indexBuffer.buffer,
//                    indexBufferOffset: submesh.indexBuffer.offset)
//        }
        renderEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)

        renderEncoder.endEncoding()
        
        guard let drawable = view.currentDrawable else {
            return
        }
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
}
