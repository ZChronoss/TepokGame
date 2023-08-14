//
//  GaugeMeter.swift
//  TepokGame
//
//  Created by Darian Elbert on 14/08/23.
//

import SpriteKit

// GaugeBackground
class GaugeBackground:SKSpriteNode{
    
    init(){
        let texture = SKTexture(imageNamed: "Gauge_Background")
        super.init(texture: texture, color:.white, size:texture.size())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
