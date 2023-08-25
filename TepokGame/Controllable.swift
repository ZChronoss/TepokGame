//
//  Controllable.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 18/08/23.
//

import Foundation
import SpriteKit

class Controllable: Character{
    override func moveIn(frame: CGRect){
        sprite.run(SKAction.move(to: CGPoint(x: frame.midX + 130, y: frame.midY), duration: 0.2))
    }
}
