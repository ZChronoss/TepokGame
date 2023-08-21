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
    var atkPoint: CGFloat
    var spd: CGFloat
    
    var maxHealth: CGFloat
    var maxMana: CGFloat
    
    var pos: CGPoint
    
    init(sprite: SKSpriteNode, healthBar: SKSpriteNode, manaBar: SKSpriteNode?, status:SKSpriteNode, health: CGFloat, mana: CGFloat, maxMana: CGFloat, maxHealth: CGFloat, atkPoint: CGFloat, spd: CGFloat, pos: CGPoint) {
        self.healthBar = healthBar
        self.manaBar = manaBar
        self.sprite = sprite
        self.health = health
        self.mana = mana
        self.atkPoint = atkPoint
        self.spd = spd
        self.pos = pos
        self.status = status
        self.maxHealth = maxHealth
        self.maxMana = maxMana
    }
    
    func takePosition(){
        sprite.position = pos
    }
}
