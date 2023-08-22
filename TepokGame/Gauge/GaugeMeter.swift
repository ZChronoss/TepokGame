//
//  GaugeMeter.swift
//  TepokGame
//
//  Created by Darian Elbert on 14/08/23.
//

import SpriteKit

// GaugeLightGreen
class GaugeLightGreen:SKSpriteNode{
    
    init(){
        let texture = SKTexture(imageNamed: "Gauge_Light_Green")
        super.init(texture: texture, color:.white, size:texture.size())
        zPosition = 101
        anchorPoint = CGPoint(x:0, y:0)
        isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// GaugeCritGreen
class GaugeCritGreen:SKSpriteNode{
    
    init(){
        let texture = SKTexture(imageNamed: "Gauge_Crit_Green")
        super.init(texture: texture, color:.white, size:texture.size())
        zPosition = 102
        anchorPoint = CGPoint(x:0, y:0)
        isUserInteractionEnabled = true
        position = CGPoint(x:72, y:0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// GaugeRedBackground
class GaugeRed:SKSpriteNode{
    init(){
        let texture = SKTexture(imageNamed: "Gauge_Background_red")
        super.init(texture:texture, color:.white, size:texture.size())
        zPosition = 100
        anchorPoint = CGPoint(x:0, y:0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
