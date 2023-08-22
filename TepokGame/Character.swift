//
//  Character.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 16/08/23.
//

import Foundation
import SpriteKit

class Character{
    var sprite: SKSpriteNode
    var healthBar: SKSpriteNode
    var manaBar: SKSpriteNode?
    var status: SKSpriteNode
    
    var health: CGFloat
    var mana: CGFloat
    var maxMana: CGFloat
    var maxHealth: CGFloat
    var atkPoint: CGFloat
    var spd: CGFloat
    
    var pos: CGPoint
    var didAction = false
    
    init(sprite: SKSpriteNode, healthBar: SKSpriteNode, manaBar: SKSpriteNode? = nil, status:SKSpriteNode, health: CGFloat, mana: CGFloat, maxMana: CGFloat, maxHealth: CGFloat, atkPoint: CGFloat, spd: CGFloat, pos: CGPoint) {
        self.sprite = sprite
        self.healthBar = healthBar
        self.manaBar = manaBar
        self.status = status
        self.health = health
        self.mana = mana
        self.maxMana = maxMana
        self.maxHealth = maxHealth
        self.atkPoint = atkPoint
        self.spd = spd
        self.pos = pos
    }
    
    func takePosition(){
        sprite.position = pos
    }
    
    func moveIn(frame: CGRect){}
    
    func moveOut(){
        sprite.run(SKAction.move(to: self.pos, duration: 0.2))
    }
}
