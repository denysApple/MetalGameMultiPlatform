//
//  Renderer.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 08.07.2023.
//

import MetalKit

class Renderer: NSObject {
    
//    var player = Player()
//    var scene = SandboxScene()
//    var gameObjcs: [Node] = [Player()]
    
}

extension Renderer: MTKViewDelegate {
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        //
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
                let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        SceneManager.TickScene(renderCommandEncoder: renderCommandEncoder!, deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        renderCommandEncoder?.endEncoding()
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
