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
    var char1Pos: CGPoint = CGPoint(x: 1045, y: 537)
    var aerdithPos: CGPoint = CGPoint(x: 987, y: 439)
    
    var char1 = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10, pos: CGPoint())
    
    var aerdith = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10, pos: CGPoint())
    
//    enemy
//    var enemy1Pos: CGPoint = CGPoint(x: 372, y: 515.102)
//    var enemy2Pos: CGPoint = CGPoint(x: 202, y: 515.102)
//    var enemy3Pos: CGPoint = CGPoint(x: 314, y: 387.297)
//    var enemy4Pos: CGPoint = CGPoint(x: 144, y: 387.297)
    
    var enemy1 = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint())
    
    var enemy2 = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 202, y: 515.102))
    
    var enemy3 = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 314, y: 387.297))
    
    var enemy4 = Character(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 144, y: 387.297))
    
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
    
    var maxCharHealthBar = 0.0
    var maxEnemyHealthBar = 0.0
    
    let green = GaugeLightGreen()
    
    var activeEnemy = 0
    
    override func didMove(to view: SKView) {
        char1.sprite = setupSprite(name: "Character_1")
        char1.pos = char1Pos
        
    
        aerdith.sprite = setupSprite(name: "Aerdith")
        aerdith.pos = aerdithPos
        
        enemy1.sprite = setupSprite(name: "Enemy_1")
        
//        spawnEnemy(enemy: enemy1, name: "Enemy_1")
        spawnEnemy(enemy: enemy2, name: "Enemy_2")
        spawnEnemy(enemy: enemy3, name: "Enemy_3")
        spawnEnemy(enemy: enemy4, name: "Enemy_4")
        
        setupEnemyHealth(parentNode: enemy1.sprite.childNode(withName: "Health_Bg_Enemy") as! SKSpriteNode, healthBar: enemy1.healthBar)
        
        maxEnemyHealthBar = enemy1.healthBar.size.width
                
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
        setupHealth(parentNode: healthBgChar1, healthBar: char1.healthBar)
        maxCharHealthBar = char1.healthBar.size.width
        
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
        healthBar.position = CGPoint(x: 5, y: 3.5)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 3
        parentNode.addChild(healthBar)
    }
    
    func setupEnemyHealth(parentNode: SKSpriteNode, healthBar: SKSpriteNode){
        healthBar.color = SKColor.red
        healthBar.size = CGSize(width: parentNode.size.width + 20, height: parentNode.size.height - 4)
        healthBar.position = CGPoint(x: -parentNode.size.width/2 - 10, y: -parentNode.size.height/2 + 2.5)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 3
        parentNode.addChild(healthBar)
    }
    
    func spawnEnemy(enemy: Character, name: String){
        enemy.sprite = enemy1.sprite.copy() as! SKSpriteNode
        enemy.sprite.name = name
        enemy.sprite.childNode(withName: "Health_Bg_Enemy")?.name = "Health_Bg_" + name
//        enemy.sprite.isUserInteractionEnabled = true
        enemy.takePosition()
        self.addChild(enemy.sprite)
        
        setupEnemyHealth(parentNode: enemy.sprite.childNode(withName: "Health_Bg_" + name) as! SKSpriteNode, healthBar: enemy.healthBar)
    }
    
    func setupHealthBg(enemy: SKSpriteNode){
        
    }
    
    func attack(target: Character, damage: CGFloat, maxHealthBar: CGFloat){
        let percentage = (damage / target.health) * 100
        let healthBarDecrease = (maxHealthBar * (percentage / 100))
        target.healthBar.size.width -= healthBarDecrease
        
        print("\(healthBarDecrease)")
    }
    
    func move(sprite: SKSpriteNode){
        sprite.run(SKAction.move(to: CGPoint(x: self.frame.midX + 130, y: self.frame.midY),
                                 duration: 0.2))
    }
    
    func gaugeDefault(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x, y: -320)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        action(sprite: aerdith.sprite)
//        spawnEnemy(sprite: enemy2.sprite)
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)

            if(node == enemy2.sprite){
                print("ENemy2")
            }
            switch node{
            case enemy1.sprite:
                print("Enemy 1")
                activeEnemy = 1
            case enemy2.sprite:
                print("Enemy 2")
                activeEnemy = 2
            case enemy3.sprite:
                print("Enemy 3")
                activeEnemy = 3
            case enemy4.sprite:
                print("Enemy 4")
                activeEnemy = 4
            default:
                break
            }

            if node == atkBtn {
                print("Attack")
                if(activeEnemy == 1){
                    attack(target: enemy1, damage: aerdith.atkPoint, maxHealthBar: maxEnemyHealthBar)
                }else if(activeEnemy == 2){
                    attack(target: enemy2, damage: aerdith.atkPoint, maxHealthBar: maxEnemyHealthBar)
                }else if(activeEnemy == 3){
                    attack(target: enemy3, damage: aerdith.atkPoint, maxHealthBar: maxEnemyHealthBar)
                }else if(activeEnemy == 4){
                    attack(target: enemy4, damage: aerdith.atkPoint, maxHealthBar: maxEnemyHealthBar)
                }
            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        move(sprite: char1)
        
    }
}
