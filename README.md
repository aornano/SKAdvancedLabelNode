![SKAdvancedLabelNode: SKLabelNode with single-handling-chars in Swift](https://github.com/aornano/SKAdvancedLabelNode/blob/master/demo.gif)

[![Build Status](https://travis-ci.org/Alamofire/Alamofire.svg?branch=master)](https://travis-ci.org/Alamofire/Alamofire)

####SKAdvancedLabelNode is an library written in Swift to improve the actual SpriteKit SKLabelNode. It contains an array of each single char of your label text re-builded as a SKLabelNode with one char to permit to animate or handling a specific char of your label.

- [Features](#features)
- [ToDo](#todo)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)


## Features

- [x] ```horizontalAlignmentMode```  
- [x] ```lineSpacingFactor``` (to adjust space between letters)
- [x] sequentially bouncing zoom animation

## ToDo

- [x] ```verticalAlignmentMode``` 
- [x] new animations

## Requirements

- iOS 8.0+
- Xcode 9.2+
- Swift 4.0+

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.

## Installation

Add the source file ```SKAdvancedLabelNode.swift``` to your project and use it.

## Usage

```
// horizontal alignment : left
var advLabel = SKAdvancedLabelNode(fontNamed:"Optima-ExtraBlack")
advLabel.name = "advLabel"
advLabel.text = labelTxt
advLabel.fontSize = 20.0
advLabel.fontColor = .green
advLabel.horizontalAlignmentMode = .left
addChild(self.advLabel)
advLabel.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.70)
advLabel.sequentiallyBouncingZoom(delay: 0.3,infinite: true)
```

