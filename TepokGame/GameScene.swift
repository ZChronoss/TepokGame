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
    
    var char = SKSpriteNode()
    
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
//        setUpChar()
        
        if let characterNode = self.childNode(withName: "Character") as? SKSpriteNode{
            char = characterNode
//            char.zPosition = 50
//            char.position = CGPoint(x: 100, y: 100)
        }
        
//        setUpChar()
    }
    
    func setUpChar(){
        char.position = CGPoint(x: CGRectGetMidX(self.frame), y: char.size.height/2 + 10)
        
        addChild(char)
    }
    
    func move(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x - 50, y: 0)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
