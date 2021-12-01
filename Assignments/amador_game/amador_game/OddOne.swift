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
    @objc func fireTimer() { //need real thing here for if you fail
        print("BAZINGA BAZGINGA BAZGAINA")
    }
    
    var timer = 30;
    var oddGuy: SKSpriteNode!
    var timerLab = SKLabelNode(fontNamed: "PartyLetPlain")
    var vicLabel = SKLabelNode(fontNamed: "PartyLetPlain")
    var timerVal: Int = 120 {
        didSet {
            timerLab.text = "\(timerVal)"
        }
    }
    
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
        
        vicLabel.position = CGPoint(x: frame.midX - 250.0, y: frame.midY + 185.0)
        vicLabel.fontSize = 80.0;
        vicLabel.fontColor = SKColor.white
        addChild(vicLabel)
        
        timerLab.position = CGPoint(x: frame.minX + 80.0, y: frame.maxY - 65.0)
        timerLab.fontSize = 80.0;
        timerLab.fontColor = SKColor.white
        timerLab.text = "\(timerVal)"
        addChild(timerLab)
        
        var mainAnimation = allAnimations.randomElement()
        var oddAnimation = allAnimations.randomElement()
        while(mainAnimation == oddAnimation) //looping incase chosen twice randomly
        {
            oddAnimation = allAnimations.randomElement()
        }
        
        var oddLocation = CGFloat(self.frame.maxX)
        let endBound = 35;
        let randomNum = Int.random(in: 1...endBound)
        let oddSubtrator = (oddLocation/(CGFloat(endBound)))

        var selectedAnimation = mainAnimation;
            var yCord = CGFloat(randomNum)//frame.minY //CGFloat(0)
            var add = Double.random(in: 10.0...13.0)
            var adder = Double.random(in: 0.1...0.8)//0.2
            var name = "";
            for i in 1...endBound
            {
                yCord = yCord + CGFloat(add)
                add += adder
                //print(yCord)
                if(add >= 15.0)
                {
                    adder = -0.8
                }
                if( i == randomNum){ //change to odd
                    selectedAnimation = oddAnimation
                    name = "weirdo"
                }
                if( i == randomNum + 1){ //reset next loop
                    selectedAnimation = mainAnimation
                    name = "normal"
                }
                oddLocation = oddLocation - oddSubtrator;
                print(oddLocation)
                createOddGuy(location: CGPoint(x: oddLocation + CGFloat(20) , y: yCord), animation: selectedAnimation!, name: name);
                
                
                let wait = SKAction.wait(forDuration: 0.5) //change countdown speed here
                let block = SKAction.run({
                    [unowned self] in

                    if self.timerVal > 0{
                        self.timerVal -= 1
                    }else{
                        self.removeAction(forKey: "countdown")
                    }
                })
                let sequence = SKAction.sequence([wait,block])
                run(SKAction.repeatForever(sequence), withKey: "countdown")
            }
        
        let wait = SKAction.wait(forDuration: 0.5) //change countdown speed here
        let block = SKAction.run({
            [unowned self] in

            if self.timerVal > 0{
                self.timerVal -= 1
            }else{
                self.removeAction(forKey: "countdown")
            }
        })
        let sequence = SKAction.sequence([wait,block])
        run(SKAction.repeatForever(sequence), withKey: "countdown")
        
    }
    func createOddGuy(location:CGPoint, animation:[SKTexture], name:String){// need to brush up on animations first here
        oddGuy = SKSpriteNode(texture: a1);
        oddGuy.position = location;
        oddGuy.zPosition = 1.0
        oddGuy.size = CGSize(width: 71, height: 61)
        oddGuy.name = name
        
        let walk = SKAction.animate(with: animation, timePerFrame: 0.15) //must figure out how to animte async
        let repeatAction = SKAction.repeatForever(walk)
        oddGuy.run(repeatAction)
        
        addChild(oddGuy);
    }
    override func mouseDown(with event: NSEvent)
    {
        let point = event.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0].name == "normal") {
            //wrong guy picked
        }
        if (nodesAtPoint[0].name == "weirdo") {
            //right guy picked
            timerLab.run(SKAction.removeFromParent())
            vicLabel.text = "GOOD JOB"
        }
        
    }
}

