//
//  MainMenu.swift
//  TepokGame
//
//  Created by Raymond Prasetio on 18/08/23.
//

import Foundation
import SpriteKit

class MainMenu: SKScene {
    
    var newGameBtn = SKSpriteNode()
    var loadGameBtn = SKSpriteNode()
    var optionBtn = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        let mainMenuMusic = SKAudioNode(fileNamed: "MainMenuSong.wav")
        self.addChild(mainMenuMusic)
    }
    
    func setupSprite(name: String) -> SKSpriteNode{
        return self.childNode(withName: name) as! SKSpriteNode
    }
    
    func switchScene() {
        let gameScene = GameScene(fileNamed: "GameScene")
        gameScene?.scaleMode = .aspectFill
        self.view?.presentScene(gameScene!, transition: SKTransition.doorsOpenHorizontal(withDuration: 1))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            newGameBtn = setupSprite(name: "newGame")
            loadGameBtn = setupSprite(name: "continue")
            
            optionBtn = setupSprite(name: "option")
            
            
            switch node {
            case newGameBtn:
                switchScene()
            case loadGameBtn:
                print("Load Game")
            case optionBtn:
                print("Option")
            default:
                break
            }
            
        }
    }
}
