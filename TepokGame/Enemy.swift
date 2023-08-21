//
//  Enemy.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 18/08/23.
//

import Foundation
import SpriteKit

class Enemy: Character{
    override func moveIn(frame: CGRect){
        print("Enemy Move")
        
        sprite.run(SKAction.move(to: CGPoint(x: frame.midX - 130, y: frame.midY), duration: 0.2))
//        let wait = SKAction.wait(forDuration: 1)
//        let moveBack = SKAction.move(to: self.pos, duration: 0.2)
//        let action = [move, wait, moveBack]
        
//        sprite.run(SKAction.sequence(action))
        
//        self.takePosition()
    }
    
}
