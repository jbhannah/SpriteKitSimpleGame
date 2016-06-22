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

        // Spawn monsters
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addMonster),
                SKAction.waitForDuration(1.0)
            ])
        ))
    }

    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }

    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }

    func addMonster() {
        // Create sprite
        let monster = SKSpriteNode(imageNamed: "monster")

        // Determine where to spawn the monster along the y axis
        let actualY = random(min: monster.size.height / 2, max: size.height - monster.size.height / 2)

        // Position the monster slightly off-screen along the right edge,
        // and at a random position along the Y axis
        monster.position = CGPoint(x: size.width + monster.size.width / 2, y: actualY)

        // Add the monster to the scene
        addChild(monster)

        // Determine the speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))

        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width / 2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
    }
}