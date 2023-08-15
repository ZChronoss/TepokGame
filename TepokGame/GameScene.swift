//
//  GameScene.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 11/08/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
//    let gaugeBackground = GaugeBackground()
    
    var char1 = SKSpriteNode()
    var char2 = SKSpriteNode()
    
    var gauge = SKSpriteNode()
    
    let green = GaugeLightGreen()
    
    override func didMove(to view: SKView) {
//        addChild(gaugeBackground)
        
        
//        let background = SKSpriteNode(imageNamed: "background_battle")
//        background.position = CGPoint(x: size.width/2, y: size.height/2)
//        background.anchorPoint = CGPoint(x: 0.5, y: 0.69)
//        background.zPosition = -1
//        background.size = CGSize(width: frame.maxX, height: frame.maxY)
//        background.setScale(2.3)
//        addChild(background)
//        let character = SKSpriteNode(imageNamed: "character_1")
        
        char1 = setupSprite(name: "Character_1")
        char2 = setupSprite(name: "Aerdith")
        
        gauge = setupSprite(name: "GaugeBackground")
        gauge.addChild(green)
//        redGauge = setupSprite(name: "RedGauge")
        
//        gauge.addChild(redGauge)
//        move(sprite: gauge)
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func move(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x - 50, y: 0)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        move(sprite: char1)
        
    }
}
