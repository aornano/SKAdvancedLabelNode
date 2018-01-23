## SKAdvancedLabelNode: SKLabelNode with single-handling-chars in Swift

![sequentially bouncing zoom animation](https://github.com/aornano/SKAdvancedLabelNode/blob/master/demo.gif) 

![shake](https://github.com/aornano/SKAdvancedLabelNode/blob/master/demo2.gif) 

[![Build Status](https://travis-ci.org/Alamofire/Alamofire.svg?branch=master)](https://travis-ci.org/Alamofire/Alamofire)
[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](https://img.shields.io/cocoapods/l/BadgeSwift.svg?style=flat)](/LICENSE)

**SKAdvancedLabelNode** is an library written in Swift to improve the actual SpriteKit ```SKLabelNode``` class. It contains an array of each single char of your text re-builded as a ```SKLabelNode``` with one char to permit to animate or handling a single char of your label, few chars or all chars of text. This opens up the possibilities to create ```CGPath``` where your char comes for example from different points of screen using for example ```UIScreen.main.bounds.size``` as reference to adjust points..

- [Features](#features)
- [ToDo](#todo)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)


## Features

Creating a New Label Node:

```
    - init(fontNamed: String?)
      Initializes a new label object with a specified font.
```

```
    - init(text: String?)
      Initializes a new label object with a text string.
```


- [x] ```lineSpacingFactor``` (to adjust space between letters)
- [x] sequentially bouncing zoom animation
- [x] shake

## ToDo
- [x] new animations
- [x] color blend factor like ```SKLabelNode```
- [x] blend mode 
- [x] ```init(attributedText: NSAttributedString?)```

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
advLabel.text = "labelTxt"
advLabel.fontSize = 20.0
advLabel.fontColor = .green
advLabel.horizontalAlignmentMode = .left
addChild(self.advLabel)
advLabel.position = CGPoint(x:frame.width / 2.5, y:frame.height*0.70)
advLabel.sequentiallyBouncingZoom(delay: 0.3,infinite: true)
```

## License
SKAdvancedLabelNode is released under the [MIT License](LICENSE)
