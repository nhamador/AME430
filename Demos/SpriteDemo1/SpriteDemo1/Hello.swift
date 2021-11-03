//
//  Hello.swift
//  SpriteDemo1
//
//  Created by student on 10/20/21.
//

import Cocoa
import SpriteKit

class Hello: SKScene
{
    override func didMove(to view: SKView)
    {
        
        backgroundColor = SKColor.black
        
        /*
        let textNode = SKLabelNode(text: "Hello there")
        textNode.position = CGPoint(x: frame.midX, y: frame.midY)
        textNode.fontSize = 60
        addChild(textNode)
        */
        let floor = SKSpriteNode(color: SKColor.green, size: CGSize(width: frame.width, height: 20.0))
        floor.position = CGPoint(x: frame.midX, y: 10.0)
        let floorBody = SKPhysicsBody(rectangleOf: floor.size)
        floorBody.isDynamic = false
        floor.physicsBody = floorBody
        addChild(floor)
        
        let robot = SKSpriteNode(imageNamed: "robot_idle")
        robot.position = CGPoint(x: frame.midX, y: frame.midY)
        robot.size = CGSize(width: 96, height: 128)
        robot.name = "TARS"
        addChild(robot)
        
        let appleTexture = SKTexture(imageNamed: "apple")
        let appleNode = SKSpriteNode(texture: appleTexture)
        appleNode.position = CGPoint(x: frame.midX + 100, y: frame.midY)
        appleNode.zRotation = 0.7
        appleNode.size = CGSize(width: 100, height: 100)
        
        let body = SKPhysicsBody(texture: appleTexture, size: appleNode.size )
        appleNode.physicsBody = body
        
        addChild(appleNode)
        
    }
    override func mouseDown(with event: NSEvent)
    {
        /*
        guard let view = view else { return }
        let gameScene = Game(size: view.frame.size)
        let transition = SKTransition.flipHorizontal(withDuration: 0.5)
        view.presentScene(gameScene, transition: transition)
         */
        let point = event.location(in: self)
        
        guard let robot = childNode(withName: "TARS") else { return }
        
        robot.position = point

    }
    override func keyDown(with event: NSEvent) {
        guard let robot = childNode(withName: "TARS") else {return }
        
        if event.characters == "a" {
            let moveAction = SKAction.moveBy(x: -100, y: 0, duration: 1.0)
            robot.run(moveAction)
        }
    }
}
