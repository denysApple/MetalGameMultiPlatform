//
//  MeshLibrary.swift
//  MetalGameMultiPlatform
//
//  Created by Denys on 08.07.2023.
//

import MetalKit

enum MeshTypes {
    case Triangle_Custom
    case Quad_Custom
}

class MeshLibrary {
    
    private static var meshes: [MeshTypes: Mesh] = [:]
    
    public static func Initialize() {
        createDefaultMeshes()
    }
    
    private static func createDefaultMeshes() {
        meshes.updateValue(Triangle_CustomMesh(), forKey: .Triangle_Custom)
        meshes.updateValue(Quad_CustomMesh(), forKey: .Quad_Custom)
    }
    
    public static func Mesh(_ meshType: MeshTypes)-> Mesh {
        return meshes[meshType]!
    }
}

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var vertexCount: Int! {
        return vertices.count
    }
    
    
    init() {
        createVertices()
        createBuffers()
    }
    
    func createBuffers() {
        vertexBuffer = Engine.Device.makeBuffer(bytes: vertices,
                                                length: Vertex.stride(vertices.count),
                                                options: [])
    }
    
    func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>( 0, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)),
            Vertex(position: SIMD3<Float>(-1,-1, 0), color: SIMD4<Float>(0, 1, 0, 1)),
            Vertex(position: SIMD3<Float>( 1,-1, 0), color: SIMD4<Float>(0, 0, 1, 1)),
        ]
    }
}


class Triangle_CustomMesh: CustomMesh {
    
    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>( 0, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)),
            Vertex(position: SIMD3<Float>(-1,-1, 0), color: SIMD4<Float>(0, 1, 0, 1)),
            Vertex(position: SIMD3<Float>( 1,-1, 0), color: SIMD4<Float>(0, 0, 1, 1)),
        ]
    }
    
}

class Quad_CustomMesh: CustomMesh {
    
    override func createVertices() {
        vertices = [
            Vertex(position: SIMD3<Float>( 1, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)), // Top Right
            Vertex(position: SIMD3<Float>(-1, 1, 0), color: SIMD4<Float>(0, 1, 0, 1)), // Top Left
            Vertex(position: SIMD3<Float>(-1,-1, 0), color: SIMD4<Float>(0, 0, 1, 1)), // Bottom Left
            
            Vertex(position: SIMD3<Float>( 1, 1, 0), color: SIMD4<Float>(1, 0, 0, 1)), // Top right
            Vertex(position: SIMD3<Float>(-1,-1, 0), color: SIMD4<Float>(0, 0, 1, 1)), // Bottom left
            Vertex(position: SIMD3<Float>( 1,-1, 0), color: SIMD4<Float>(1, 0, 1, 1)), // bottom right
        ]
    }
    
}
