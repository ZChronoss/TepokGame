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
    var health: CGFloat
    var mana: CGFloat
    var atkPoint: CGFloat
    var spd: CGFloat
    
    init(sprite: SKSpriteNode, health: CGFloat, mana: CGFloat, atkPoint: CGFloat, spd: CGFloat) {
        self.sprite = sprite
        self.health = health
        self.mana = mana
        self.atkPoint = atkPoint
        self.spd = spd
    }
}
