//
//  Character.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 16/08/23.
//

import Foundation
import SpriteKit

class Character: Equatable{
    static func == (lhs: Character, rhs: Character) -> Bool {
        return lhs.sprite.name == rhs.sprite.name
    }
    
    var sprite: SKSpriteNode
    var healthBar: SKSpriteNode
    var manaBar: SKSpriteNode?
    var status: SKSpriteNode
    
    var health: CGFloat
    var mana: CGFloat
    var atkPoint: CGFloat
    var spd: CGFloat
    
    var maxHealth: CGFloat
    var maxMana: CGFloat
    
    var pos: CGPoint
    var didAction = false
    
    var idleAnimation: String
    var attackAnimation: String
    
    init(sprite: SKSpriteNode, healthBar: SKSpriteNode, manaBar: SKSpriteNode? = nil, status: SKSpriteNode, health: CGFloat, mana: CGFloat, atkPoint: CGFloat, spd: CGFloat, maxHealth: CGFloat, maxMana: CGFloat, pos: CGPoint, idleAnimation: String, attackAnimation: String) {
        self.sprite = sprite
        self.healthBar = healthBar
        self.manaBar = manaBar
        self.status = status
        self.health = health
        self.mana = mana
        self.atkPoint = atkPoint
        self.spd = spd
        self.maxHealth = maxHealth
        self.maxMana = maxMana
        self.pos = pos
        self.idleAnimation = idleAnimation
        self.attackAnimation = attackAnimation
    }
    
    func takePosition(){
        sprite.position = pos
    }
    
    func moveIn(frame: CGRect){}
    
    func moveOut(){
        sprite.run(SKAction.move(to: self.pos, duration: 0.2))
    }
    
    func doAttack(){
        let frames = createTexture(_name: attackAnimation)
        sprite.removeAction(forKey: "Idle")
        sprite.run(
            SKAction.animate(
                with: frames,
                timePerFrame: 0.1
            ),
            withKey: "Attack"
        )
        sprite.run(
            SKAction.animate(
                with: frames,
                timePerFrame: 0.1
            ),
            completion: {
                let moveout = SKAction.move(to: self.pos, duration: 0.2)
                let frames = self.createTexture(_name: self.idleAnimation)
                let idle =
                    SKAction.repeatForever(
                        SKAction.animate(
                            with: frames,
                            timePerFrame: 0.15,
                            resize: false,
                            restore: true
                        )
                    )
                let completionAction = SKAction.sequence([moveout, idle])
                
                self.sprite.run(completionAction)
            })
    }
    
    func createTexture(_name: String) -> [SKTexture]{
        let textureAtlas = SKTextureAtlas(named: _name)
        var textureArray:[SKTexture] = []
        for i in 0...textureAtlas.textureNames.count-1{
            textureArray.append(textureAtlas.textureNamed("\(_name)_\(i)"))
        }
        
        return textureArray
    }
    
    func buildSprite(){
        sprite.removeAllActions()
        let frames = createTexture(_name: idleAnimation)
        sprite = SKSpriteNode(imageNamed: SKTextureAtlas(named: idleAnimation).textureNames[0])
        sprite.setScale(3)
        self.sprite.run(
            SKAction.repeatForever(
                SKAction.animate(
                    with: frames,
                    timePerFrame: 0.15,
                    resize: false,
                    restore: true
                )
            ),
            withKey: "Idle"
        )
    }
}
