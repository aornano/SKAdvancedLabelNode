//
//  GameViewController.swift
//  SKAdvancedLabelNode
//
//  Created by Alessandro Ornano on 14/01/2018.
//  Copyright © 2018 Alessandro Ornano. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("---")
        print("∙ \(type(of: self))")
        print("---")
        guard let view = self.view as! SKView? else { return }
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsPhysics = true
        view.showsDrawCount = true
        
        let scene = GameScene(size:view.bounds.size)
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
