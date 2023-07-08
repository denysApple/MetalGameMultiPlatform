//
//  Renderable.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 08.07.2023.
//

import MetalKit

protocol Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
    
}
