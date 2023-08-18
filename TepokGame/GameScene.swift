//
//  GameScene.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 11/08/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var char1 = SKSpriteNode()
    var char2 = SKSpriteNode()
    
    var enemy = SKSpriteNode()
    
    var gauge = SKSpriteNode()
    
    let gaugeGreen = GaugeLightGreen()
    let gaugeCrit = GaugeCritGreen()
    let gaugePlayer = GaugePlayer()
    let gaugeRed = GaugeRed()
    
    override func didMove(to view: SKView) {
        char1 = setupSprite(name: "Character_1")
        char2 = setupSprite(name: "Aerdith")
        
        enemy = setupSprite(name: "Enemy_1")
        
        gauge = setupSprite(name: "GaugeBackground")

        gauge.childNode(withName:"RedGauge")?.addChild(gaugeGreen)
        gaugeGreen.addChild(gaugeCrit)
        gaugePlayer.zPosition = 104

        gauge.childNode(withName: "RedGauge")?.addChild(gaugePlayer)
        
        gaugeGreen.position = CGPoint(x:400, y:0)
        gaugeMove(sprite: gaugePlayer)
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func move(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x + 500, y: self.frame.midY)
    }
    
    func gaugeDefault(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x, y: -320)
    }
    
    func gaugeMove(sprite: SKSpriteNode){
        let newPos = SKAction.moveTo(x: 710, duration: 3.0)
        let oldPos = SKAction.moveTo(x:0, duration: 3.0)
        sprite.run(SKAction.repeatForever(SKAction.sequence([newPos,oldPos])))
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        move(sprite: char2)
    }
    
    var i = 0
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Gauge Checker
        let gaugePlayerPosition = gaugePlayer.position
        let gaugeGreenPositionMin = gaugeGreen.position
        let gaugeGreenPositionMax = CGPoint(x:gaugeGreenPositionMin.x+gaugeGreen.size.width, y:gaugeGreenPositionMin.y)
        
        let gaugeCritPositionMin = CGPoint(x: gaugeCrit.position.x + gaugeGreenPositionMin.x, y: gaugeCrit.position.y)
        let gaugeCritPositionMax =  CGPoint(x:gaugeCritPositionMin.x+gaugeCrit.size.width, y:gaugeCritPositionMin.y)


        if(gaugePlayerPosition.x < gaugeCritPositionMax.x && gaugePlayerPosition.x > gaugeCritPositionMin.x){
            print("CRIT!!!")
            
            print(gaugePlayerPosition)
            
            print(gaugeCritPositionMin)
            print(gaugeCritPositionMax)
            
            
        }else if(gaugePlayerPosition.x < gaugeGreenPositionMax.x && gaugePlayerPosition.x > gaugeGreenPositionMin.x){
            print("NormalDamage")
            
            print(gaugePlayerPosition)
            
            print(gaugeGreenPositionMin)
            print(gaugeGreenPositionMax)
        }
    }
}
