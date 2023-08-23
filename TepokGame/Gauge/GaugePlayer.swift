//
//  GaugePlayer.swift
//  TepokGame
//
//  Created by Darian Elbert on 16/08/23.
//

import SpriteKit

class GaugePlayer:SKSpriteNode{
    init(){
        let texture = SKTexture(imageNamed: "Gauge_Player")
        super.init(texture: texture, color:.white, size:texture.size())
        isUserInteractionEnabled = true
        zPosition = 105
        anchorPoint = CGPoint(x:0, y:0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
