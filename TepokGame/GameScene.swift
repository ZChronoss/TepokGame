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
    var char1Stats = SKSpriteNode()
    var healthBgChar1 = SKSpriteNode()
    var manaBgChar1 = SKSpriteNode()
    var char1HP = SKLabelNode()
    var char1MP = SKLabelNode()
    
    var maxChar1HealthBar = 0.0
    var maxChar1ManaBar = 0.0
    
    var maxEnemyHealthBar = 0.0
    
    let green = GaugeLightGreen()
    
    override func didMove(to view: SKView) {
        char1.sprite = setupSprite(name: "Character_1")
        char1.pos = char1Pos
        
    
        aerdith.sprite = setupSprite(name: "Aerdith")
        aerdith.pos = aerdithPos
        
        enemy1.sprite = setupSprite(name: "Enemy_1")
        
//        spawnEnemy(enemy: enemy1, name: "Enemy_1")
        spawnEnemy(enemy: enemy2, name: "Enemy_2")
        spawnEnemy(enemy: enemy3, name: "Enemy_3")
        
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
        
        
        char1Stats = setupSprite(name: "Char1_Stats")
        healthBgChar1 = setupChildSprite(name: "Health_Bg_1", parent:char1Stats)
        setupHealth(parentNode: healthBgChar1, healthBar: char1.healthBar)
        manaBgChar1 = setupChildSprite(name: "Mana_Bg_1", parent:char1Stats)
        setupMana(parentNode: manaBgChar1, manaBar: char1.manaBar!)
        char1HP = setupLabel(name: "HPLabel1", parent: char1Stats)
        char1MP = setupLabel(name: "MPLabel1", parent: char1Stats)
        char1HP.text = "\(aerdith.health)"
        char1HP.fontSize = 25
        char1MP.text = "\(aerdith.mana)"
        char1MP.fontSize = 25
        
        maxChar1HealthBar = char1.healthBar.size.width
        maxChar1ManaBar = char1.manaBar!.size.width
        
//        redGauge = setupSprite(name: "RedGauge")
        
//        gauge.addChild(redGauge)
//        move(sprite: gauge)
        gaugeDefault(sprite: gauge)
    }
    
    func setupStats(stat: SKSpriteNode, player: Character, name: String){
        
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func setupChildSprite(name: String, parent: SKSpriteNode) -> SKSpriteNode{
        return parent.childNode(withName: name) as! SKSpriteNode
    }
    
    func setupLabel(name: String, parent: SKSpriteNode) -> SKLabelNode{
        return parent.childNode(withName: name) as! SKLabelNode
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
        healthBar.color = SKColor.green
        healthBar.size = CGSize(width: parentNode.size.width-25, height: parentNode.size.height-3.5)
        healthBar.position = CGPoint(x: 5, y: 5.5)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 3
        parentNode.addChild(healthBar)
        print(parentNode.size.width)
        print(parentNode.size.height)
        
        print(healthBar.size.width)
        print(healthBar.size.height)
    }
    
    func setupMana(parentNode: SKSpriteNode, manaBar: SKSpriteNode){
        manaBar.color = SKColor.systemBlue
        manaBar.size = CGSize(width: parentNode.size.width-25, height: parentNode.size.height-3.5)
        manaBar.position = CGPoint(x: 5, y: 5.5)
        manaBar.anchorPoint = CGPoint(x: 0, y: 0)
        manaBar.zPosition = 3
        parentNode.addChild(manaBar)
        print(parentNode.size.width)
        print(parentNode.size.height)
        
        print(manaBar.size.width)
        print(manaBar.size.height)
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
//            var activeNode = Character

            switch node{
            case enemy1.sprite:
                print("Enemy 1")
//                activeNode =
            case enemy2.sprite:
                print("Enemy 2")
            case enemy3.sprite:
                print("Enemy 3")
            case enemy4.sprite:
                print("Enemy 4")
            default:
                break
            }
                        
            if node == atkBtn {
                print("Attack")
//                attack(target: activeNode, damage: aerdith.atkPoint, maxHealthBar: maxEnemyHealthBar)
            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        move(sprite: char1)
    }
}
