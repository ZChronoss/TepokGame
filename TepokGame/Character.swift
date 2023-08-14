//
//  Character.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 14/08/23.
//

import Foundation
import SpriteKit

class Character: SKSpriteNode {
    
    init(texture: SKTexture, size: CGSize){
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
//    init() {
//        let texture = SKTexture(imageNamed: "character_1")
//
//        self.name = "Main Char"
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func move(){
        self.position = CGPoint(x: self.position.x - 50, y: 0)
    }
}
