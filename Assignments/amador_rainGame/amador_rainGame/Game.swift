//
//  Game.swift
//  amador_rainGame
//
//  Created by student on 11/1/21.
//

import Cocoa
import SpriteKit

class Game: SKScene, SKPhysicsContactDelegate
{
    var points = 0;
    override func didMove(to view: SKView)
    {
        backgroundColor = SKColor.black
        physicsWorld.contactDelegate = self

        let pointsLabel = SKLabelNode()
        pointsLabel.position = CGPoint(x: frame.minX + 80.0, y: frame.maxY - 65.0)
        pointsLabel.fontSize = 80.0;
        pointsLabel.fontColor = SKColor.white
        pointsLabel.text = "\(points)"
        addChild(pointsLabel)
        
        let floor = SKSpriteNode(color: SKColor.green, size: CGSize(width: 10000, height: 25.0))
        floor.name = "Ground"
        floor.position = CGPoint(x: frame.midX, y: 10.0)
        let floorBody = SKPhysicsBody(rectangleOf: floor.size)
        floorBody.isDynamic = false
        floor.physicsBody = floorBody
        addChild(floor)
        
        let catcher = SKSpriteNode(imageNamed: "catcher")
        catcher.position = CGPoint(x: frame.midX, y: frame.midY)
        catcher.size = CGSize(width: 120, height: 148)
        catcher.name = "hands"
        let handBody = SKPhysicsBody(texture: SKTexture(imageNamed: "catcher"), size: catcher.size)
        handBody.usesPreciseCollisionDetection = true
        handBody.contactTestBitMask = 1
        catcher.physicsBody = handBody
        catcher.physicsBody?.isDynamic = false
        addChild(catcher)
        let maxX = Double(frame.maxX)
        let runAction = SKAction.run
        {
            let randX = Double.random(in: 20.0 ... maxX);
            self.createRain(position: CGPoint(x: randX, y: 800))
            pointsLabel.text = "\(self.points)"
            if(self.points >= 50)
            {
            let winScene = Intro(size: view.frame.size)
            let transition = SKTransition.flipHorizontal(withDuration: 0.5)
            view.presentScene(winScene, transition: transition)
            }
        }
        
        let waitAction = SKAction.wait(forDuration: 2.0)
        let sequence = SKAction.sequence([waitAction, runAction])
        let repeatAction = SKAction.repeatForever(sequence)
        run(repeatAction)

        

    }
    func createRain(position: CGPoint)
    {
        let rain = SKSpriteNode(imageNamed: "rainTexture")
       // let rand = Int.random(in: 1...1000)
        rain.position = position
        rain.size = CGSize(width: 120, height: 148)
        rain.name = "Droplet"
        let rainBody = SKPhysicsBody(texture: SKTexture(imageNamed: "rainTexture"), size: rain.size)
        rainBody.contactTestBitMask = 1
        rain.physicsBody = rainBody
        addChild(rain)

    }
    override func keyDown(with event: NSEvent) {
        guard let catcher = childNode(withName: "hands") else {return }
        
        if event.characters == "a" {
            let moveAction = SKAction.moveBy(x: -200, y: 0, duration: 0.25)
            catcher.run(moveAction)
        }
        if event.characters == "d" {
            let moveAction = SKAction.moveBy(x: 200, y: 0, duration: 0.25)
            catcher.run(moveAction)
        }
        if event.characters == "w" {
            let moveAction = SKAction.moveBy(x: 0, y: 200, duration: 0.25)
            catcher.run(moveAction)
        }
        if event.characters == "s" {
            let moveAction = SKAction.moveBy(x: 0, y: -200, duration: 0.25)
            catcher.run(moveAction)
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else
        {
            print("contact does not have two nodes")
            return
        }
        guard let nameA = nodeA.name, let nameB = nodeB.name else {
            return
        }
        
        
        if nameA == "Ground" && nameB == "Droplet" { //names may be case sensitive
            print("rain hit the dang floor")
            nodeB.run(SKAction.removeFromParent()) //not sure what this does
            points -= 1
        }
        if nameA == "hands" && nameB == "Droplet" { //names may be case sensitive
            print("caught rain")
            nodeB.run(SKAction.removeFromParent()) 
            points += 10
        }

    }
}
