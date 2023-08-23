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
        
    }
    
    func createTexture(_name: String) -> [SKTexture]{
        let textureAtlas = SKTextureAtlas(named: _name)
        var textureArray:[SKTexture] = []
        for i in 0...textureAtlas.textureNames.count-1{
            textureArray.append(textureAtlas.textureNamed("\(_name)_\(i)"))
        }
        
        return textureArray
    }
    
    func buildSprite(name: String){
        let frames = createTexture(_name: name)
        self.sprite = SKSpriteNode()
        sprite = SKSpriteNode(imageNamed: SKTextureAtlas(named: name).textureNames[0])
        sprite.setScale(3)
        sprite.position = CGPoint(x: 640, y: 320)
        self.sprite.run(SKAction.repeatForever(
            SKAction.animate(
                with: frames,
                timePerFrame: 0.15,
                resize: false,
                restore: true
            )
        ))
        
        
//        sprite.run(
//            SKAction.repeatForever(
//                SKAction.animate(
//                    with: textureArray,
//                    timePerFrame: 0.15,
//                    resize: false,
//                    restore: true
//                )
//            )
//        )
//
//
//        self.sprite = sprite
    }
}
