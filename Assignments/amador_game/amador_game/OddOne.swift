//
//  OddOne.swift
//  amador_game
//
//  Created by student on 11/17/21.
//

import Cocoa
import SpriteKit

class OddOne: SKScene, SKPhysicsContactDelegate
{
    var timer = 30;
    var oddGuy: SKSpriteNode!
    override func didMove(to view: SKView)
    {
        backgroundColor = SKColor.purple
        physicsWorld.contactDelegate = self

        /*
        let timerLabel = SKLabelNode()
        timerLabel.position = CGPoint(x: frame.minX + 80.0, y: frame.maxY - 65.0)
        timerLabel.fontSize = 80.0;
        timerLabel.fontColor = SKColor.white
        timerLabel.text = "\(timer)"
        addChild(timerLabel)
         */
        var oddLocation = CGFloat(self.frame.maxX)
        let endBound = 35;
        let oddSubtrator = oddLocation/CGFloat(endBound)
        for i in 1...endBound
        //(let i = 0 ; i < 100 ; i ++)
        {
            oddLocation = oddLocation - oddSubtrator;
            createOddGuy(location: CGPoint(x: oddLocation , y: self.frame.midY));
        }
        
       
    


        

    }
    func createOddGuy(location:CGPoint){// need to brush up on animations first here
        let a1 = SKTexture(imageNamed:"guyWalking5-1")
        let a2 = SKTexture(imageNamed:"guyWalking5-2")
        let a3 = SKTexture(imageNamed:"guyWalking5-3")
        let oddOne = [a1, a2, a3];
        
        oddGuy = SKSpriteNode(texture: a1);
        oddGuy.position = location;
        oddGuy.zPosition = 1.0
        oddGuy.size = CGSize(width: 71, height: 61)
        oddGuy.name = "weirdo"
        
        
        let walk = SKAction.animate(with: oddOne, timePerFrame: 0.1) //must figure out how to animte async
        let repeatAction = SKAction.repeatForever(walk)
        oddGuy.run(repeatAction)
        
        addChild(oddGuy);

    }

    func didBegin(_ contact: SKPhysicsContact) {
        

    }
}

