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
    let gaugeBackground = GaugeLightGreen()

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
        if let scene = MainMenu(fileNamed: "MainMenu"){
            let skView = self.view as! SKView
//            skView.showsFPS = true
//            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
//            skView.preferredFramesPerSecond = 60
            scene.scaleMode = .aspectFill
//            scene.size = self.view.bounds.size
            skView.presentScene(scene)
        }
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
