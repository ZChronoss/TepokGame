//
//  Character.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 14/08/23.
//

import Foundation
import SpriteKit

class Character: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "character_1")
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
//        self.name = "Main Char"
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
