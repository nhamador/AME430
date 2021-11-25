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
    
    let a1 = SKTexture(imageNamed:"guyWalking1-1")
    let a2 = SKTexture(imageNamed:"guyWalking1-2")
    let a3 = SKTexture(imageNamed:"guyWalking1-3")
    
    let b1 = SKTexture(imageNamed:"guyWalking2-1")
    let b2 = SKTexture(imageNamed:"guyWalking2-2")
    
    let c1 = SKTexture(imageNamed:"guyWalking3-1")
    let c2 = SKTexture(imageNamed:"guyWalking3-2")
    
    let d1 = SKTexture(imageNamed:"guyWalking4-1")
    let d2 = SKTexture(imageNamed:"guyWalking4-2")
    let d3 = SKTexture(imageNamed:"guyWalking4-3")
    
    let e1 = SKTexture(imageNamed:"guyWalking5-1")
    let e2 = SKTexture(imageNamed:"guyWalking5-2")
    let e3 = SKTexture(imageNamed:"guyWalking5-3")
    

    
    override func didMove(to view: SKView)
    {
        backgroundColor = SKColor.purple
        physicsWorld.contactDelegate = self

        let set1 = [a1, a2, a3];
        let set2 = [b1, b2];
        let set3 = [c1, c2];
        let set4 = [d1, d2, d3];
        let set5 = [e1, e2, e3];
        
        let allAnimations = [set1, set2, set3, set4, set5];
        
        var mainAnimation = allAnimations.randomElement()
        var oddAnimation = allAnimations.randomElement()
        while(mainAnimation == oddAnimation) //looping incase chosen twice randomly
        {
            oddAnimation = allAnimations.randomElement()
        }
        
        var oddLocation = CGFloat(self.frame.maxX)
        let endBound = 35;
        let oddSubtrator = oddLocation/CGFloat(endBound)
        let randomNum = Int.random(in: 1...endBound)
        var selectedAnimation = mainAnimation;
        for i in 1...endBound
        //(let i = 0 ; i < 100 ; i ++)
        {
            if( i == randomNum){ //change to odd
                selectedAnimation = oddAnimation
            }
            if( i == randomNum + 1){ //reset next loop
                selectedAnimation = mainAnimation
            }
            
            oddLocation = oddLocation - oddSubtrator;
            createOddGuy(location: CGPoint(x: oddLocation , y: self.frame.midY), animation: selectedAnimation!);
        }
        
       
    


        

    }
    func createOddGuy(location:CGPoint, animation:[SKTexture]){// need to brush up on animations first here

        
        oddGuy = SKSpriteNode(texture: a1);
        oddGuy.position = location;
        oddGuy.zPosition = 1.0
        oddGuy.size = CGSize(width: 71, height: 61)
        oddGuy.name = "weirdo"
        
        
        let walk = SKAction.animate(with: animation, timePerFrame: 0.1) //must figure out how to animte async
        let repeatAction = SKAction.repeatForever(walk)
        oddGuy.run(repeatAction)
        
        addChild(oddGuy);

    }

    func didBegin(_ contact: SKPhysicsContact) {
        

    }
}

