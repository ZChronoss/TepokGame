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
    
//    character
//    var char1Sprite = SKSpriteNode()
    var char1: Character = Character(sprite: SKSpriteNode() ,health: 200, mana: 100, atkPoint: 20, spd: 10)
    
//    var aerdithSprite = SKSpriteNode()
    var aerdith: Character = Character(sprite: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10)
    
//    enemy
    var enemy = SKSpriteNode()
    
//    gauge
    var gauge = SKSpriteNode()
    
//    action background
    var actionBack = SKSpriteNode()
    
//    Buttons
    var atkBtn = SKSpriteNode()
    var magBtn = SKSpriteNode()
    var itmBtn = SKSpriteNode()
    var fleeBtn = SKSpriteNode()
    
//    status
    var healthBgChar1 = SKSpriteNode()
    var healthBarChar1 = SKSpriteNode()
    
//    turn
    var turn = SKSpriteNode()
    
    let green = GaugeLightGreen()
    
//    override init(size: CGSize){
//        let maxAspectRatio: CGFloat = 16.0/9.0
//        let playableHeight = size.width/maxAspectRatio
//        let playableMargin = (size.height - playableHeight)/2.0
//        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
//        super.init(size: size)
//    }
//
//    required init?(coder aDecoder: NSCoder){
//        fatalError("init(coder:) has not been implemented")
//    }
    
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

//        char1Sprite = setupSprite(name: "Character_1")
        turn = setupSprite(name: "turn")
        char1.sprite = setupSprite(name: "Character_1")
        
//        aerdithSprite = setupSprite(name: "Aerdith")
        aerdith.sprite = setupSprite(name: "Aerdith")
        
        enemy = setupSprite(name: "Enemy_1")
        
        gauge = setupSprite(name: "GaugeBackground")
        gauge.addChild(green)
        
        actionBack = setupSprite(name: "Action_Back")
        
//        Buttons
        atkBtn = setupBtn(name: "Btn_Attack")
        magBtn = setupBtn(name: "Btn_Magic")
        itmBtn = setupBtn(name: "Btn_Item")
//        ini kurang flee
        
//        Status
        healthBgChar1 = setupSprite(name: "Health_Bg")
        setupHealth(parentNode: healthBgChar1, healthBar: healthBarChar1)
        
//        redGauge = setupSprite(name: "RedGauge")
        
//        gauge.addChild(redGauge)
//        move(sprite: gauge)
        gaugeDefault(sprite: gauge)
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func setupBtn(name: String) -> SKSpriteNode{
        return actionBack.childNode(withName: name) as! SKSpriteNode
    }
    
    func action(sprite: SKSpriteNode){
        actionBack.run(SKAction.move(to: CGPoint(x: self.frame.maxX + 30, y: actionBack.position.y),
                                     duration: 0.2))
        move(sprite: sprite)
    }
    
    func setupHealth(parentNode: SKSpriteNode, healthBar: SKSpriteNode){
        healthBar.color = SKColor.red
        healthBar.size = CGSize(width: parentNode.size.width - 10, height: parentNode.size.height - 6)
        healthBar.position = CGPoint(x: 5, y: 3)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 3
        parentNode.addChild(healthBar)
    }
    
    func attack(damage: CGFloat, healthBar: SKSpriteNode){
        healthBar.size.width -= damage
    }
    
    func move(sprite: SKSpriteNode){
        sprite.run(SKAction.move(to: CGPoint(x: self.frame.midX + 130, y: self.frame.midY),
                                 duration: 0.2))
//        sprite.run(SKAction.moveBy(x: 50, y: 50, duration: 1.0))
//        sprite.position = CGPoint(x: sprite.position.x - 50, y: self.frame.midY)
    }
    
    func gaugeDefault(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x, y: -320)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        action(sprite: aerdith.sprite)
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            switch node{
            case atkBtn:
                print("Attack")
                attack(damage: aerdith.atkPoint, healthBar: healthBarChar1)
            case magBtn:
                print("Magic")
            case itmBtn:
                print("Item")
            default:
                break
            }
//            if node == atkBtn {
//                print("Attack")
//            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        move(sprite: char1)
        
    }
}
