//
//  GameViewController.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 07.07.2023.
//

import UIKit
import MetalKit

// Our iOS specific view controller
class GameViewController: UIViewController {

//    var renderer: Renderer!
    var mtkView: MTKView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        guard let mtkView = view as? MTKView else {
//            print("View of Gameview controller is not an MTKView")
//            return
//        }
        self.view = GameView()
//        view.addSubview(mtkView)

        // Select the device to render with.  We choose the default device
        
        
//        mtkView.device = defaultDevice
//        mtkView.backgroundColor = UIColor.black

//        guard let newRenderer = Renderer(metalKitView: mtkView) else {
//            print("Renderer cannot be initialized")
//            return
//        }
//
//        renderer = newRenderer

//        renderer.mtkView(mtkView, drawableSizeWillChange: mtkView.drawableSize)

//        mtkView.delegate = renderer
    }
}
