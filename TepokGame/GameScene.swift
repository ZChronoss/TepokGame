//
//  GameScene.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 11/08/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    let gaugeBackground = GaugeBackground()
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background_battle")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.69)
        background.zPosition = -1
        background.size = CGSize(width: frame.maxX, height: frame.maxY)
//        background.setScale(2.3)
        addChild(background)
        addChild(gaugeBackground)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
