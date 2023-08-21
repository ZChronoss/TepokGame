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
    
    var char1 = Controllable(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10, pos: CGPoint(x: 1045, y: 537))
    
    var aerdith = Controllable(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10, pos: CGPoint(x: 987, y: 439))
    
//    enemy
//    var enemy1Pos: CGPoint = CGPoint(x: 372, y: 515.102)
//    var enemy2Pos: CGPoint = CGPoint(x: 202, y: 515.102)
//    var enemy3Pos: CGPoint = CGPoint(x: 314, y: 387.297)
//    var enemy4Pos: CGPoint = CGPoint(x: 144, y: 387.297)
    
    var enemy1 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 372, y: 515.102))
    
    var enemy2 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 202, y: 515.102))
    
    var enemy3 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 314, y: 387.297))
    
    var enemy4 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, health: 200, mana: 0, atkPoint: 10, spd: 5, pos: CGPoint(x: 144, y: 387.297))
    
    var listOfMove: [Character] = []
    var sortedListOfMove: [Character] = []
    
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
    
    var maxCharHP = 200.0
    var maxEnemyHP = 200.0
    
    let green = GaugeLightGreen()
    
    var activeEnemy = 1

    
    override func didMove(to view: SKView) {
        char1.sprite = setupSprite(name: "Character_1")
        char1.pos = char1Pos
        
    
        aerdith.sprite = setupSprite(name: "Aerdith")
        aerdith.pos = aerdithPos
        listOfMove.append(char1)
        listOfMove.append(aerdith)
        
        enemy1.sprite = setupSprite(name: "Enemy_1")
        listOfMove.append(enemy1)
        
//        spawnEnemy(enemy: enemy1, name: "Enemy_1")
        spawnEnemy(enemy: enemy2, name: "Enemy_2")
        spawnEnemy(enemy: enemy3, name: "Enemy_3")
        spawnEnemy(enemy: enemy4, name: "Enemy_4")
        
        setupEnemyHealth(parentNode: enemy1.sprite.childNode(withName: "Health_Bg_Enemy") as! SKSpriteNode, healthBar: enemy1.healthBar)
        
        sortedListOfMove = listOfMove.sorted(by: {
            $0.spd > $1.spd
        })
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
        
//        sortedListOfMove.first!.moveIn(frame: self.frame)
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func setupBtn(name: String) -> SKSpriteNode{
        return actionBack.childNode(withName: name) as! SKSpriteNode
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
        enemy.takePosition()
        self.addChild(enemy.sprite)
        
        listOfMove.append(enemy)
        
        setupEnemyHealth(parentNode: enemy.sprite.childNode(withName: "Health_Bg_" + name) as! SKSpriteNode, healthBar: enemy.healthBar)
    }
    
    func attack(target: Character, damage: CGFloat, maxHealthBar: CGFloat, maxHP: CGFloat){
        if(target.health - damage < 0){
            target.health = 0
//            target.healthBar.color = .clear
            target.sprite.removeFromParent()
        }else{
            let percentage = (damage / maxEnemyHP) * 100
            let healthBarDecrease = (maxHealthBar * (percentage / 100))
            target.healthBar.size.width -= healthBarDecrease
            target.health -= damage
        }
    }
    
    func action(){
        var idx = 0
        
        repeat{
            if sortedListOfMove[idx] is Controllable{
                let backMoveIn = SKAction.move(to: CGPoint(x: frame.maxX + 30, y: actionBack.position.y), duration: 0.2)
                
//                atkBtn.
                while !sortedListOfMove[idx].didAction{
                    
                }
                
                let wait = SKAction.wait(forDuration: 1)
                let backMoveOut = SKAction.move(to: CGPoint(x: 1910.01, y: actionBack.position.y), duration: 0.2)
                
                actionBack.run(SKAction.sequence([backMoveIn, wait, backMoveOut]))
                
            }
            
            
//            run(SKAction.run(sortedListOfMove[idx].action(frame: self.frame)))
            
            
            idx += 1
//            sleep(2)
        }while idx < listOfMove.count
    }
    
    func enemyAction(enemy: Enemy){
        
    }
    
    func gaugeDefault(sprite: SKSpriteNode){
        sprite.position = CGPoint(x: sprite.position.x, y: -320)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        action()
//        aerdith.action(frame: self.frame)
//        spawnEnemy(sprite: enemy2.sprite)
        sortedListOfMove.first!.moveIn(frame: self.frame)
        if(sortedListOfMove.first! is Controllable){
            actionBack.run(SKAction.move(to: CGPoint(x: frame.maxX + 30, y: actionBack.position.y), duration: 0.2))
        }
        
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if(sortedListOfMove.first! is Enemy){
                attack(target: char1, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxCharHealthBar, maxHP: maxCharHP)
                sortedListOfMove.first!.didAction = true
            }else{
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
                        attack(target: enemy1, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar, maxHP: maxEnemyHP)
                    }else if(activeEnemy == 2){
                        attack(target: enemy2, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar, maxHP: maxEnemyHP)
                    }else if(activeEnemy == 3){
                        attack(target: enemy3, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar, maxHP: maxEnemyHP)
                    }else if(activeEnemy == 4){
                        attack(target: enemy4, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar, maxHP: maxEnemyHP)
                    }
                    sortedListOfMove.first!.didAction = true
                }
            }
            
            if sortedListOfMove.first!.didAction{
                if sortedListOfMove.first! is Controllable{
                    actionBack.run(SKAction.move(to: CGPoint(x: 1910.01, y: actionBack.position.y), duration: 0.2))
                }
                sortedListOfMove.first!.moveOut()
                
                sortedListOfMove.first!.didAction = false
                
                sortedListOfMove.append(sortedListOfMove.first!)
                sortedListOfMove.removeFirst()
            }
        }

    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        move(sprite: char1)
        
    }
}
