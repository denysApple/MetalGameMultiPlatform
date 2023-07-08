//
//  GameObject.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 08.07.2023.
//

import MetalKit

class GameObject: Node {
    
    var modelContants = ModelConstants()
    var mesh: Mesh!
    
    init(meshType: MeshTypes) {
        self.mesh = MeshLibrary.Mesh(meshType)
    }
    
    var time: Float = 0
    
    override func update(deltaTime: Float) {
        time += deltaTime
//        self.position.x = sin(time)
//        self.position.y = sin(time)
//        self.rotation.z = cos(time)
        self.scale = SIMD3<Float>(repeating: cos(time))
        
        updateModelConstants()
//        print(time)
//        print(deltaPosition)
    }
    
    private func updateModelConstants() {
        modelContants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&modelContants, length: ModelConstants.stride, index: 1)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
