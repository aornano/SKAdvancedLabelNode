//
//  SKAdvancedLabelNode.swift
//  Sprite-kit
//
//  Created by Alessandro Ornano on 12/01/2018.
//  Copyright © 2018 Alessandro Ornano. All rights reserved.
//

import Foundation
import SpriteKit

class SKAdvancedLabelNode: SKNode {
    let colt = SKLabelNode()
    var labels = [SKLabelNode]()
    var text = "" {
        didSet {
            refreshLabels()
        }
    }
    var fontName = String() {
        didSet {
            _ = labels.flatMap({ $0.fontName = fontName })
            refreshLabels()
        }
    }
    var fontSize = CGFloat(10.0) {
        didSet {
            _ = labels.flatMap({ $0.fontSize = fontSize })
            refreshLabels()
        }
    }
    var fontColor = UIColor.init(white: 1.0, alpha: 1.0) {
        didSet {
            _ = labels.flatMap({ $0.fontColor = fontColor })
            refreshLabels()
        }
    }
    var horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.init(rawValue: 0) { // left
        didSet {
            _ = labels.flatMap({ $0.horizontalAlignmentMode = horizontalAlignmentMode! })
            refreshLabels()
        }
    }
    var verticalAlignmentMode = SKLabelVerticalAlignmentMode.init(rawValue: 0) { // center
        didSet {
            _ = labels.flatMap({ $0.verticalAlignmentMode = verticalAlignmentMode! })
            refreshLabels()
        }
    }
    var lineSpacingFactor: CGFloat = -1.3 { 
        didSet {
            refreshLabels()
        }
    }
    override init() {
        super.init()
    }
    convenience init(with txt: String) {
        self.init()
        text = txt
    }
    convenience init(fontNamed fontName: String?) {
        self.init(with: "")
        if let f = fontName {
            self.fontName = f
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func refreshLabels() {
        _ = labels.flatMap({ $0.removeFromParent() })
        labels.removeAll()
        if text.count > 0 {
            var newX: CGFloat = 0.0
            var gapX: CGFloat = 0.0
            let ghostSpace = SKLabelNode(text: ".")
            ghostSpace.fontName = fontName
            ghostSpace.fontSize = fontSize
            let ghostSpaceWidth = ghostSpace.frame.size.width
            var fullNodeWidth:CGFloat = 0.0
            for char in text {
                if String(char) != " " {
                    let charLabelNode = SKLabelNode(text: String(char))
                    charLabelNode.fontName = fontName
                    charLabelNode.fontSize = fontSize
                    fullNodeWidth += charLabelNode.frame.size.width + lineSpacingFactor
                } else {
                    fullNodeWidth += ghostSpaceWidth + lineSpacingFactor
                }
            }
            switch horizontalAlignmentMode {
                case .left? : gapX = 0.0
                case .center? : gapX = fullNodeWidth/2
                case .right? : gapX = fullNodeWidth
                default: break
            }
            var index: Int = 0
            for char in text {
                if String(char) != " " {
                    let charLabelNode = SKLabelNode(text: String(char))
                    charLabelNode.fontName = fontName
                    charLabelNode.fontSize = fontSize
                    charLabelNode.fontColor = fontColor
                    charLabelNode.horizontalAlignmentMode = .left
                    charLabelNode.verticalAlignmentMode = verticalAlignmentMode!
                    charLabelNode.position.x = newX - gapX
                    charLabelNode.alpha = 1
                    self.addChild(charLabelNode)
                    labels.append(charLabelNode)
                    newX += charLabelNode.frame.size.width + lineSpacingFactor
                } else {
                    ghostSpace.horizontalAlignmentMode = .left
                    ghostSpace.verticalAlignmentMode = verticalAlignmentMode!
                    ghostSpace.position.x = newX - gapX
                    labels.append(ghostSpace)
                    newX += ghostSpaceWidth + lineSpacingFactor
                }
                index += 1
            }
        }
    }
}
extension SKAdvancedLabelNode {
    // #-#-#-#-#-#-#-#-#-#-#-#-#-#-#
    //MARK: - Animations
    // #-#-#-#-#-#-#-#-#-#-#-#-#-#-#
    
    func sequentiallyBouncingZoom(delay:TimeInterval, infinite:Bool = false) {
        if labels.count > 0 && self.action(forKey: "sequentiallyBouncingZoom") == nil {
            let main = SKAction.run { [weak self] in
                guard let strongSelf = self else { return }
                for i in 0..<strongSelf.labels.count {
                    let zoomIn = SKAction.scale(to: 2.0, duration: delay)
                    let zoomOut = SKAction.scale(to: 1.0, duration: delay)
                    let currentDuration = delay * TimeInterval(i)
                    let wait = SKAction.wait(forDuration: currentDuration)
                    let seq = SKAction.sequence([wait,zoomIn,zoomOut])
                    let currentLab = strongSelf.labels[i]
                    currentLab.run(seq, withKey: "seq\(i)")
                }
            }
            let waitAfter = SKAction.wait(forDuration: delay * TimeInterval(self.labels.count+1))
            let seq = SKAction.sequence([main,waitAfter])
            let finalAction = infinite ? SKAction.repeatForever(seq) : main
            self.run(finalAction, withKey: "sequentiallyBouncingZoom")
        }
    }
}
