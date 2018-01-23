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
    var fontName = "HelveticaNeue-UltraLight" {
        didSet {
            _ = labels.flatMap({ $0.fontName = fontName })
            refreshLabels()
        }
    }
    var fontSize = CGFloat(30.0) {
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
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    convenience init(fontNamed fontName: String?) {
        self.init(text: "")
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
extension SKAction {
    class func afterDelay(_ delay: TimeInterval, performAction action: SKAction) -> SKAction {
        return SKAction.sequence([SKAction.wait(forDuration: delay), action])
    }
    class func afterDelay(_ delay: TimeInterval, runBlock block: @escaping () -> Void) -> SKAction {
        return SKAction.afterDelay(delay, performAction: SKAction.run(block))
    }
}
extension SKAction {
    class func shake(duration:TimeInterval, amplitudeX:CGFloat = 3.0, amplitudeY:CGFloat = 3, speed : TimeInterval = 0.015) -> SKAction {
        let numberOfShakes = duration / speed / 2.0
        var actionsArray:[SKAction] = []
        for _ in 1...Int(numberOfShakes) {
            let dx = CGFloat(arc4random_uniform(UInt32(amplitudeX))) - CGFloat(amplitudeX / 2)
            let dy = CGFloat(arc4random_uniform(UInt32(amplitudeY))) - CGFloat(amplitudeY / 2)
            let forward = SKAction.moveBy(x: dx, y:dy, duration: speed)
            let reverse = forward.reversed()
            actionsArray.append(forward)
            actionsArray.append(reverse)
        }
        return SKAction.sequence(actionsArray)
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
    
    func shake(delay:TimeInterval, infinite:Bool = false, duration:TimeInterval = 5.0, amplitudeX:CGFloat = 10.0, amplitudeY:CGFloat = 10.0, speed:TimeInterval=0.25) {
        if labels.count > 0 && self.action(forKey: "shake") == nil {
            let originalPositions = self.labels.map({ return $0.position })
            let main = SKAction.run { [weak self] in
                guard let strongSelf = self else { return }
                for i in 0..<strongSelf.labels.count {
                    let currentLab = strongSelf.labels[i]
                    let shake = SKAction.shake(duration: duration, amplitudeX: amplitudeX, amplitudeY: amplitudeY, speed: speed)
                    let returnToPos = SKAction.move(to: originalPositions[i], duration: speed)
                    let shakeAfter = SKAction.afterDelay(delay, performAction:SKAction.sequence([shake,returnToPos]))
                    currentLab.run(shakeAfter, withKey: "shakeAfter\(i)")
                }
            }
            let waitAfter = SKAction.wait(forDuration: delay * TimeInterval(self.labels.count+1))
            let seq = SKAction.sequence([main,waitAfter])
            let finalAction = infinite ? SKAction.repeatForever(seq) : main
            self.run(finalAction, withKey: "shake")
        }
    }
}
