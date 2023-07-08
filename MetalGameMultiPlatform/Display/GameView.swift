//
//  GameView.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 07.07.2023.
//

import MetalKit

class GameView: MTKView {
    
    var renderer: Renderer!
    
    init() {
        super.init(frame: CGRect.zero, device: MTLCreateSystemDefaultDevice())
        self.prepare()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.prepare()
    }
    
    private func prepare() {
        self.device = MTLCreateSystemDefaultDevice()
        
        Engine.Ignite(device: device!)
        self.colorPixelFormat = Preferences.MainPixelFormat
        self.clearColor = Preferences.ClearColor
        self.renderer = Renderer()
        
        self.delegate = renderer
    }
    
    // Mouse input
    
    // Keyboard input
    
}
