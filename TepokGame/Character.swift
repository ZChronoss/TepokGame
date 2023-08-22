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
    
    init(sprite: SKSpriteNode, healthBar: SKSpriteNode, manaBar: SKSpriteNode? = nil, status: SKSpriteNode, health: CGFloat, mana: CGFloat, atkPoint: CGFloat, spd: CGFloat, maxHealth: CGFloat, maxMana: CGFloat, pos: CGPoint) {
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
    }
    
    func takePosition(){
        sprite.position = pos
    }
    
    func moveIn(frame: CGRect){}
    
    func moveOut(){
        sprite.run(SKAction.move(to: self.pos, duration: 0.2))
    }
}
