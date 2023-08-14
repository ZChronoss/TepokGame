//
//  GameViewController.swift
//  TepokGame
//
//  Created by Renaldi Antonio on 11/08/23.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    let gaugeBackground = GaugeBackground()

    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let scene = GameScene(size: (CGSize(width: 2048, height: 1536)))
//        let skView = self.view as! SKView
//        skView.showsFPS = true
//        skView.showsNodeCount = true
//        skView.ignoresSiblingOrder = true
//        scene.scaleMode = .aspectFill
////        scene.size = self.view.bounds.size
//        skView.presentScene(scene)
        
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                scene.addChild(gaugeBackground)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
