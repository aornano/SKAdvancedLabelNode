//
//  GameScene.swift
//  SKAdvancedLabelNode
//
//  Created by Alessandro Ornano on 14/01/2018.
//  Copyright © 2018 Alessandro Ornano. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var label : SKLabelNode!
    var label2 : SKLabelNode!
    var label3 : SKLabelNode!
    var advLabel : SKAdvancedLabelNode!
    var advLabel2 : SKAdvancedLabelNode!
    var advLabel3 : SKAdvancedLabelNode!
    
    override func didMove(to view: SKView) {
        // #MARK: Classic labels
        // horizontal alignment : left
        let labelTxt = "Left Label Demo"
        self.label = SKLabelNode(fontNamed:"Optima-ExtraBlack")
        self.label.name = "label"
        self.label.text = labelTxt
        self.label.fontSize = 20.0
        self.label.fontColor = .white
        self.label.horizontalAlignmentMode = .left
        self.addChild(self.label)
        self.label.zPosition = 1
        self.label.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.80)
        self.label.alpha = 1
        
        // horizontal alignment : center
        let label2Txt = "Center Label Demo"
        self.label2 = SKLabelNode(fontNamed:"Optima-ExtraBlack")
        self.label2.name = "label2"
        self.label2.text = label2Txt
        self.label2.fontSize = 20.0
        self.label2.fontColor = .white
        self.label2.horizontalAlignmentMode = .center
        self.addChild(self.label2)
        self.label2.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.60)
        
        // horizontal alignment : right
        let label3Txt = "Right Label Demo"
        self.label3 = SKLabelNode(fontNamed:"Optima-ExtraBlack")
        self.label3.name = "label3"
        self.label3.text = label3Txt
        self.label3.fontSize = 20.0
        self.label3.fontColor = .white
        self.label3.horizontalAlignmentMode = .right
        self.addChild(self.label3)
        self.label3.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.40)
        
        // #MARK: Advenced labels
        // horizontal alignment : left
        self.advLabel = SKAdvancedLabelNode(fontNamed:"Optima-ExtraBlack")
        self.advLabel.name = "advLabel"
        self.advLabel.text = labelTxt
        self.advLabel.fontSize = 20.0
        self.advLabel.fontColor = .green
        self.advLabel.horizontalAlignmentMode = .left
        self.addChild(self.advLabel)
        self.advLabel.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.70)
        //self.advLabel.sequentiallyBouncingZoom(delay: 0.3,infinite: true)
        self.advLabel.shake(delay:1.0, infinite:true)
        
        // horizontal alignment : center
        self.advLabel2 = SKAdvancedLabelNode(fontNamed:"Optima-ExtraBlack")
        self.advLabel2.name = "advLabel2"
        self.advLabel2.text = label2Txt
        self.advLabel2.fontSize = 20.0
        self.advLabel2.fontColor = .green
        self.advLabel2.horizontalAlignmentMode = .center
        self.addChild(self.advLabel2)
        self.advLabel2.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.50)
        //self.advLabel2.sequentiallyBouncingZoom(delay: 0.3,infinite: true)
        self.advLabel2.shake(delay:1.0, infinite:true)
        
        // horizontal alignment : right
        self.advLabel3 = SKAdvancedLabelNode(fontNamed:"Optima-ExtraBlack")
        self.advLabel3.name = "advLabel3"
        self.advLabel3.text = label3Txt
        self.advLabel3.fontSize = 20.0
        self.advLabel3.fontColor = .green
        self.advLabel3.horizontalAlignmentMode = .right
        self.addChild(self.advLabel3)
        self.advLabel3.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.30)
        //self.advLabel3.sequentiallyBouncingZoom(delay: 0.3,infinite: true)
        self.advLabel3.shake(delay:1.0, infinite:true)
        
        // Description to understand what happened to screen:
        let node1 = SKLabelNode(fontNamed:"Arial")
        node1.name = "node1"
        node1.text = "classic label with white color"
        node1.fontSize = 10.0
        node1.fontColor = .white
        node1.horizontalAlignmentMode = .left
        self.addChild(node1)
        node1.position = CGPoint(x:frame.width / 1.5, y:frame.height*0.15)
        let node2 = SKLabelNode(fontNamed:"Arial")
        node2.name = "node2"
        node2.text = "advanced label with green color"
        node2.fontSize = 10.0
        node2.fontColor = .green
        node2.horizontalAlignmentMode = .left
        self.addChild(node2)
        node2.position = CGPoint(x:frame.width / 1.5, y:frame.height*0.10)
        
    }

}
