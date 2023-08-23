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
    var char1 = Controllable(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), status: SKSpriteNode(), health: 250, mana: 150, atkPoint: 20, spd: 10, maxHealth: 250, maxMana: 150, pos: CGPoint(x: 1045, y: 537))
    
    var aerdith = Controllable(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: SKSpriteNode(), status: SKSpriteNode(), health: 200, mana: 100, atkPoint: 20, spd: 10, maxHealth: 200, maxMana: 100, pos: CGPoint(x: 987, y: 439))

    
    var enemy1 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, status: SKSpriteNode(), health: 200, mana: 0, atkPoint: 10, spd: 5, maxHealth: 200, maxMana: 0, pos: CGPoint(x: 372, y: 515.102))
    
    var enemy2 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, status: SKSpriteNode(), health: 200, mana: 0, atkPoint: 10, spd: 5, maxHealth: 200, maxMana: 0, pos: CGPoint(x: 202, y: 515.102))
    
    var enemy3 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, status: SKSpriteNode(), health: 200, mana: 0, atkPoint: 10, spd: 5, maxHealth: 200, maxMana: 0, pos: CGPoint(x: 314, y: 387.297))
    
    var enemy4 = Enemy(sprite: SKSpriteNode(), healthBar: SKSpriteNode(), manaBar: nil, status: SKSpriteNode(), health: 200, mana: 0, atkPoint: 10, spd: 5, maxHealth: 200, maxMana: 0, pos: CGPoint(x: 144, y: 387.297))

    var listOfMove: [Character] = []
    var listOfControllables: [Controllable] = []
    var listOfEnemies: [Enemy] = []
    
    var sortedListOfMove: [Character] = []
    
//    gauge
    var gauge = SKSpriteNode()
    let gaugeGreen = GaugeLightGreen()
    let gaugeCrit = GaugeCritGreen()
    let gaugePlayer = GaugePlayer()
    let gaugeRed = GaugeRed()
    
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
    
    var char2Stats = SKSpriteNode()
    var healthBgChar2 = SKSpriteNode()
    var manaBgChar2 = SKSpriteNode()
    var char2HP = SKLabelNode()
    var char2MP = SKLabelNode()
    
    var maxChar1HealthBar = 0.0
    var maxChar1ManaBar = 0.0
    
    var maxChar2HealthBar = 0.0
    var maxChar2ManaBar = 0.0
    
    var maxEnemyHealthBar = 0.0
    
    let green = GaugeLightGreen()
    
    var activeEnemy = 1

    
    override func didMove(to view: SKView) {
        
//    Battle scene music
        let battleMusic = SKAudioNode(fileNamed: "BattleSceneSong.wav")
        self.addChild(battleMusic)
        
        char1.sprite = setupSprite(name: "Character_1")
        
        aerdith.sprite = setupSprite(name: "Aerdith")
        
        listOfMove.append(char1)
        listOfMove.append(aerdith)
        
        listOfControllables.append(char1)
        listOfControllables.append(aerdith)
        
        enemy1.sprite = setupSprite(name: "Enemy_1")
        listOfMove.append(enemy1)
        listOfEnemies.append(enemy1)
        
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
        char1.status = setupSprite(name: "Char1_Stats")
        
        healthBgChar1 = setupChildSprite(name: "Health_Bg_Char1", parent:char1.status)
        setupHealth(parentNode: healthBgChar1, healthBar: char1.healthBar)
        manaBgChar1 = setupChildSprite(name: "Mana_Bg_Char1", parent:char1.status)
        setupMana(parentNode: manaBgChar1, manaBar: char1.manaBar!)
        char1HP = setupLabel(name: "HPLabel1", parent: char1.status)
        char1MP = setupLabel(name: "MPLabel1", parent: char1.status)
        char1HP.text = "\(char1.health)"
        char1HP.fontSize = 25
        char1MP.text = "\(char1.mana)"
        char1MP.fontSize = 25
        
        maxChar1HealthBar = char1.healthBar.size.width
        maxChar1ManaBar = char1.manaBar!.size.width
        
        aerdith.status = setupSprite(name: "Char2_Stats")
        
        healthBgChar2 = setupChildSprite(name: "Health_Bg_Char2", parent:aerdith.status)
        setupHealth(parentNode: healthBgChar2, healthBar: aerdith.healthBar)
        manaBgChar2 = setupChildSprite(name: "Mana_Bg_Char2", parent:aerdith.status)
        setupMana(parentNode: manaBgChar2, manaBar: aerdith.manaBar!)
        char2HP = setupLabel(name: "HPLabel2", parent: aerdith.status)
        char2MP = setupLabel(name: "MPLabel2", parent: aerdith.status)
        char2HP.text = "\(aerdith.health)"
        char2HP.fontSize = 25
        char2MP.text = "\(aerdith.mana)"
        char2MP.fontSize = 25
        
        maxChar2HealthBar = aerdith.healthBar.size.width
        maxChar2ManaBar = aerdith.manaBar!.size.width
        
//        redGauge = setupSprite(name: "RedGauge")

        gauge.childNode(withName:"RedGauge")?.addChild(gaugeGreen)
        gaugeGreen.addChild(gaugeCrit)
        gaugePlayer.zPosition = 104

        gauge.childNode(withName: "RedGauge")?.addChild(gaugePlayer)
        
        gaugeGreen.position = CGPoint(x:400, y:0)
        gaugeMove(sprite: gaugePlayer)
    }
    
//    func setupBars(Menu)
    
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
    
    func setupHealth(parentNode: SKSpriteNode, healthBar: SKSpriteNode){
        healthBar.color = SKColor.green
        healthBar.size = CGSize(width: parentNode.size.width-25, height: parentNode.size.height-3.5)
        healthBar.position = CGPoint(x: 5, y: 5.5)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 5
        parentNode.addChild(healthBar)
    }
    
    func setupMana(parentNode: SKSpriteNode, manaBar: SKSpriteNode){
        manaBar.color = SKColor.systemBlue
        manaBar.size = CGSize(width: parentNode.size.width-25, height: parentNode.size.height-3.5)
        manaBar.position = CGPoint(x: 5, y: 5.5)
        manaBar.anchorPoint = CGPoint(x: 0, y: 0)
        manaBar.zPosition = 5
        parentNode.addChild(manaBar)
    }
    
    func setupEnemyHealth(parentNode: SKSpriteNode, healthBar: SKSpriteNode){
        healthBar.color = SKColor.red
        healthBar.size = CGSize(width: parentNode.size.width + 20, height: parentNode.size.height - 4)
        healthBar.position = CGPoint(x: -parentNode.size.width/2 - 10, y: -parentNode.size.height/2 + 2.5)
        healthBar.anchorPoint = CGPoint(x: 0, y: 0)
        healthBar.zPosition = 3
        parentNode.addChild(healthBar)
    }
    
    func spawnEnemy(enemy: Enemy, name: String){
        enemy.sprite = enemy1.sprite.copy() as! SKSpriteNode
        enemy.sprite.name = name
        enemy.sprite.childNode(withName: "Health_Bg_Enemy")?.name = "Health_Bg_" + name
//        enemy.sprite.isUserInteractionEnabled = true
        enemy.takePosition()
        self.addChild(enemy.sprite)
        
        listOfMove.append(enemy)
        listOfEnemies.append(enemy)
        
        setupEnemyHealth(parentNode: enemy.sprite.childNode(withName: "Health_Bg_" + name) as! SKSpriteNode, healthBar: enemy.healthBar)
    }
    
    func attack(target: Character, damage: CGFloat, maxHealthBar: CGFloat){
//        let 
        
        if(target.health - damage <= 0){
            target.health = 0
            target.healthBar.size.width = 0
//            target.healthBar.color = .clear
            target.sprite.removeFromParent()
            if let i = sortedListOfMove.firstIndex(of: target) {
                sortedListOfMove.remove(at: i)
            }
            
            if target is Controllable{
                if let i = listOfControllables.firstIndex(of: target as! Controllable){
                    listOfControllables.remove(at: i)
                }
            }else{
                if let i = listOfEnemies.firstIndex(of: target as! Enemy){
                    listOfEnemies.remove(at: i)
                }
            }
        }else{
            let percentage = (damage / target.maxHealth) * 100
            let healthBarDecrease = (maxHealthBar * (percentage / 100))
            target.healthBar.size.width -= healthBarDecrease
            target.health -= damage
        }
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
        sortedListOfMove.first!.moveIn(frame: self.frame)
        if(sortedListOfMove.first! is Controllable){
            actionBack.run(SKAction.move(to: CGPoint(x: frame.maxX + 30, y: actionBack.position.y), duration: 0.2))
        }
        
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if(sortedListOfMove.first! is Enemy){
                if(!listOfControllables.isEmpty){
                    let random = Int.random(in: 0...listOfControllables.count - 1)
                    attack(target: listOfControllables[random], damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxChar1HealthBar)
                    updateStat()
                    sortedListOfMove.first!.didAction = true
                }
                
                
            }else{
                if(listOfEnemies.isEmpty){
                    print("All Enemies are Dead")
                }else if listOfControllables.isEmpty{
                    print("All heroes are dead")
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
                        let slashSound = SKAction.playSoundFileNamed("slash", waitForCompletion: false)
                        run(slashSound)
                        if(activeEnemy == 1){
                            if(enemy1.health <= 0){
                                activeEnemy = 2
                            }else{
                                attack(target: enemy1, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar)
                            }
                        }else if(activeEnemy == 2){
                            if(enemy2.health <= 0){
                                activeEnemy = 3
                            }else{
                                attack(target: enemy2, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar)
                            }
                        }else if(activeEnemy == 3){
                            if(enemy3.health <= 0){
                                activeEnemy = 4
                            }else{
                                attack(target: enemy3, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar)
                            }
                        }else if(activeEnemy == 4){
                            if(enemy4.health <= 0){
                                activeEnemy = 1
                            }else{
                                attack(target: enemy4, damage: sortedListOfMove.first!.atkPoint, maxHealthBar: maxEnemyHealthBar)
                            }
                        }
                        sortedListOfMove.first!.didAction = true
                    }
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
        func updateStat(){
            char1HP.text = "\(char1.health)"
            char1HP.fontSize = 25
            char1MP.text = "\(char1.mana)"
            char1MP.fontSize = 25

            char2HP.text = "\(aerdith.health)"
            char2HP.fontSize = 25
            char2MP.text = "\(aerdith.mana)"
            char2MP.fontSize = 25
        }
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
