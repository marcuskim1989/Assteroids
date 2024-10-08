//
//  SpaceshipNode.swift
//  Assteroids
//
//  Created by Marcus Kim on 6/15/24.
//

import Foundation
import SpriteKit

class SpaceshipNode: SKSpriteNode, PhysicsNodeProtocol{
    
   // func generateSpaceShip(position: CGPoint = CGPoint(x: 0, y: 0)) -> SKSpriteNode? {
    //        if let paperPlaneSymbolImage = UIImage(systemName: "hand.point.right")?.withTintColor(.white) {
    //
    //            let data = paperPlaneSymbolImage.pngData()
    //            let newImage = UIImage(data: data!)
    //            let texture = SKTexture(image: newImage!)
    //            spaceship = SKSpriteNode(texture: texture)
    //            spaceship.name = "spaceship"
    //            spaceship.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //            //spaceship.size = CGSize(width: CGFloat(50.0), height: CGFloat(50.0))
    //            spaceship.position = position
    //            spaceship.zRotation = CGFloat.pi / 2
    //
    //            spaceship.physicsBody = SKPhysicsBody(rectangleOf: spaceship.size)
    //
    //            //init(physicsBody: SKPhysicsBody(rectangleOf: ))
    //
    //            spaceship.physicsBody?.isDynamic = true
    //            spaceship.physicsBody?.linearDamping = 1.0
    //            spaceship.physicsBody?.velocity = CGVector(dx: 0, dy: 0)  // Ensure no initial velocity
    //            spaceship.physicsBody?.angularVelocity = 0  // Ensure no initial angular velocity
    //            spaceship.physicsBody?.affectedByGravity = false
    //
    //            if let flameImage = UIImage(systemName: "flame")?.withTintColor(.white) {
    //
    //                let data = flameImage.pngData()
    //                let newImage = UIImage(data: data!)
    //                let texture = SKTexture(image: newImage!)
    //                flame = SKSpriteNode(texture: texture)
    //                flame.scale(to: CGSize(width: 32.0, height: 48.0))
    //
    //                flame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    //                //spaceship.size = CGSize(width: CGFloat(50.0), height: CGFloat(50.0))
    //
    //                flame.position = spaceship.position
    //                //flame.position.y -= 5
    //
    //                flame.position = CGPoint(x: -50, y: 0)
    //                flame.zRotation = spaceship.zRotation
    //                flame.isHidden = true
    //                spaceship.addChild(flame)
    //
    //            }
    //
    //            return spaceship
    //
    //        }
    //
    //        return nil
    //    }
    
    
    required init(systemName: String = K.spaceshipAssetName, anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5), size: CGSize = CGSize(width: 50.0, height: 50.0), position: CGPoint = CGPoint(x: 0, y: 0), zPosition: CGFloat = 10, zRotation: CGFloat = CGFloat.pi / 2, name: String = "spaceship") {
        var asset: UIImage {
            
            var newImage = UIImage()
            
            if let safeAsset = UIImage(systemName: systemName)?.withTintColor(.white) {
                let data = safeAsset.pngData()
                newImage = UIImage(data: data!)!
                
            }
            
            return newImage
        }
        let texture = SKTexture(image: asset)
        super.init(texture: texture, color: .white, size: texture.size())
        self.anchorPoint = anchorPoint
        self.position = position
        self.zPosition = zPosition
        self.zRotation = zRotation
        self.name = name
        
        createFlame()
        createPhysicsBody(size: size)
        
    }
    
    required init(named: String = K.spaceshipAssetName, anchorPoint: CGPoint = CGPoint(x: 0.5, y: 0.5), size: CGSize = CGSize(width: 50.0, height: 50.0), position: CGPoint = CGPoint(x: 0.0, y: 0.0), zPosition: CGFloat = 10, zRotation: CGFloat = CGFloat.pi / 2, name: String = "spaceship") {
        var asset: UIImage {
            
            var newImage = UIImage()
            
            if let safeAsset = UIImage(named: named)?.withTintColor(.white) {
                let data = safeAsset.pngData()
                newImage = UIImage(data: data!)!
                
            }
            
            return newImage
        }
        let texture = SKTexture(image: asset)
        super.init(texture: texture, color: .white, size: texture.size())
        self.anchorPoint = anchorPoint
        self.position = position
        self.zPosition = zPosition
        self.zRotation = zRotation
        self.name = name
        
        createFlame()
        createPhysicsBody(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPhysicsBody(size: CGSize) {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        
        //init(physicsBody: SKPhysicsBody(rectangleOf: ))
        
        self.physicsBody?.isDynamic = true
        self.physicsBody?.linearDamping = 1.0
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)  // Ensure no initial velocity
        self.physicsBody?.angularVelocity = 0  // Ensure no initial angular velocity
        self.physicsBody?.affectedByGravity = false
    }
    
    func createFlame() {
        if let flameImage = UIImage(systemName: K.flameAssetName)?.withTintColor(.white) {
            
            let data = flameImage.pngData()
            let newImage = UIImage(data: data!)
            let texture = SKTexture(image: newImage!)
            let flame = SKSpriteNode(texture: texture)
            flame.scale(to: CGSize(width: 32.0, height: 48.0))
            flame.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            //spaceship.size = CGSize(width: CGFloat(50.0), height: CGFloat(50.0))
        
            flame.position = self.position
            //flame.position.y -= 5
            
            flame.position = CGPoint(x: -50, y: 0)
            flame.zRotation = self.zRotation
            flame.isHidden = false
            flame.name = K.flameAssetName
            
            self.addChild(flame)
            
        }
    }
    
    
}
