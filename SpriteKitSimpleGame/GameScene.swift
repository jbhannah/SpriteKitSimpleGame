//
//  GameScene.swift
//  SpriteKitSimpleGame
//
//  Created by Jesse B. Hannah on 6/21/16.
//  Copyright (c) 2016 Jesse B. Hannah. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    // Create sprite
    let player = SKSpriteNode(imageNamed: "player")

    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.whiteColor()

        // Determine where to spawn the player
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)

        // Add the player to the scene
        addChild(player)
    }
}