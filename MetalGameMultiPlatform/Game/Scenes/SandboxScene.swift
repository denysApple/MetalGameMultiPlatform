import MetalKit

class SandboxScene: Scene {
    
    let player = Player()
    
    override func buildScene() {
        addChild(player)
    }
}
