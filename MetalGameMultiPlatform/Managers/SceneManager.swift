import MetalKit

enum SceneTypes{
    case Sandbox
    case Background
}

class SceneManager {
    
    private static var _currentScene: Scene!
    
    public static func Initialize(_ sceneType: SceneTypes) {
        SetScene(sceneType)
    }
    
    public static func SetScene(_ sceneType: SceneTypes) {
        switch sceneType {
        case .Sandbox:
            _currentScene = SandboxScene()
        case .Background:
            _currentScene = BackgroundScene()
        }
    }
    
    public static func TickScene(renderCommandEncoder: MTLRenderCommandEncoder,
                                 deltaTime: Float) {
        
        _currentScene.update(deltaTime: deltaTime)
        _currentScene.render(renderCommandEncoder: renderCommandEncoder)
    }
    
}
