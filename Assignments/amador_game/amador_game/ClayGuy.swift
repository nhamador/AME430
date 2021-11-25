//
//  OddOne.swift
//  amador_game
//
//  Created by student on 11/17/21.
//

import Cocoa
import SpriteKit

class ClayGuy: SKScene, SKPhysicsContactDelegate
{
   // var timer = 30;
    @objc func fireTimer() { //need real thing here for if you fail
        print("BAZINGA BAZGINGA BAZGAINA")
    }
    //let timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    var timerLabel = SKLabelNode(fontNamed: "PartyLetPlain")
    var vicLabel = SKLabelNode(fontNamed: "MarketFelt-Wide")
    var timerVal: Int = 45 {
        didSet {
            timerLabel.text = "\(timerVal)"
        }
    }
    var leftEye: SKSpriteNode!
    var rightEye: SKSpriteNode!
    var mouth: SKSpriteNode!
    var hat: SKSpriteNode!
    var blankFace: SKSpriteNode!
    
    var leftEyeStart: CGPoint! //maybe no !
    var rightEyeStart: CGPoint!
    var mouthStart: CGPoint!
    var hatStart: CGPoint!
    var blankStart: CGPoint!
    
    let a1 = SKTexture(imageNamed:"lEye")
    let a2 = SKTexture(imageNamed:"rEye")
    let a3 = SKTexture(imageNamed:"hat")
    let a4 = SKTexture(imageNamed:"mouth")
    
    // lrmh
    // 0000
    let blank = SKTexture(imageNamed:"0000")
    let onlyHat = SKTexture(imageNamed:"0001")
    let onlyMouth = SKTexture(imageNamed:"0010")
    let mouthHat = SKTexture(imageNamed:"0011")
    let onlyRight = SKTexture(imageNamed:"0100")
    let rightHat = SKTexture(imageNamed:"0101")
    let rightMouth = SKTexture(imageNamed:"0110")
    let rightMouthHat = SKTexture(imageNamed:"0111")
    let onlyLeft = SKTexture(imageNamed:"1000")
    let leftHat = SKTexture(imageNamed:"1001")
    let leftMouth = SKTexture(imageNamed:"1010")
    let leftMouthHat = SKTexture(imageNamed:"1011")
    let leftRight = SKTexture(imageNamed:"1100")
    let leftRightHat = SKTexture(imageNamed:"1101")
    let leftRightMouth = SKTexture(imageNamed:"1110")
    let fullFace = SKTexture(imageNamed:"1111")
    
    //we skip 5, 5 is not a good number
    let vic1 = SKTexture(imageNamed: "1")
    let vic2 = SKTexture(imageNamed: "2")
    let vic3 = SKTexture(imageNamed: "3")
    let vic4 = SKTexture(imageNamed: "4")
    let vic6 = SKTexture(imageNamed: "6")
    let vic7 = SKTexture(imageNamed: "7")
    let vic8 = SKTexture(imageNamed: "8")
    let vic9 = SKTexture(imageNamed: "9")
    let vic10 = SKTexture(imageNamed: "10")
    let vic11 = SKTexture(imageNamed: "11")
    let vic12 = SKTexture(imageNamed: "12")
    let vic13 = SKTexture(imageNamed: "13")
    let vic14 = SKTexture(imageNamed: "14")
    let vic15 = SKTexture(imageNamed: "15")
    let vic16 = SKTexture(imageNamed: "16")
    

    
    var leftPlaced = 0;
    var rightPlaced = 0;
    var mouthPlaced = 0;
    var hatPlaced = 0;
    
    var selectedTexture: SKTexture!
    let scale = 3;
    

    override func didMove(to view: SKView)
    {
        backgroundColor = SKColor.systemPink
        physicsWorld.contactDelegate = self
        createClayComp();
        
        vicLabel.position = CGPoint(x: frame.midX - 250.0, y: frame.midY + 185.0)
        vicLabel.fontSize = 80.0;
        vicLabel.fontColor = SKColor.white
        addChild(vicLabel)

        timerLabel.position = CGPoint(x: frame.minX + 80.0, y: frame.maxY - 65.0)
        timerLabel.fontSize = 80.0;
        timerLabel.fontColor = SKColor.white
        timerLabel.text = "\(timerVal)"
        addChild(timerLabel)
        
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
    func createClayComp(){// need to brush up on animations first here

        
        leftEyeStart = CGPoint(x: frame.minX + 135, y: frame.midY);
        rightEyeStart = CGPoint(x: frame.minX + 350, y: frame.midY + 200);
        mouthStart = CGPoint(x: frame.minX + 225, y: frame.midY + 100);
        hatStart = CGPoint(x: frame.minX + 275, y: frame.midY - 85);
        blankStart = CGPoint(x: frame.midX, y: frame.midY);
        

        
        leftEye = SKSpriteNode(texture: a1);
        leftEye.position = leftEyeStart;
        leftEye.zPosition = 1.0
        leftEye.size = CGSize(width: 235, height: 141)
        leftEye.name = "leftEye"
        
        rightEye = SKSpriteNode(texture: a2);
        rightEye.position = rightEyeStart;
        rightEye.zPosition = 1.0
        rightEye.size = CGSize(width: 235, height: 141)
        rightEye.name = "rightEye"
        
        mouth = SKSpriteNode(texture: a4);
        mouth.position = mouthStart;
        mouth.zPosition = 1.0
        mouth.size = CGSize(width: 235, height: 141)
        mouth.name = "mouth"
        
        hat = SKSpriteNode(texture: a3);
        hat.position = hatStart;
        hat.zPosition = 1.0
        hat.size = CGSize(width: 242, height: 236)
        hat.name = "hat"
        
        blankFace = SKSpriteNode(texture: blank)
        blankFace.position = blankStart;
        blankFace.size = CGSize(width: 698, height: 422)
        blankFace.name = "0000"
        
        
        addChild(leftEye)
        addChild(rightEye)
        addChild(mouth)
        addChild(hat)
        addChild(blankFace)
    }
    func resetAllNodeLocation()
    {
        leftEye.position = leftEyeStart
        rightEye.position = rightEyeStart
        mouth.position = mouthStart
        hat.position = hatStart
    }
    override func mouseDown(with event: NSEvent)
    {
        let point = event.location(in: self)
        print(point.x)
        print(point.y)
        
    }
    override func mouseDragged(with event: NSEvent)
    {
        
        let point = event.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == mouth) {
            mouth.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == leftEye) {
            leftEye.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == rightEye) {
            rightEye.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == hat) {
            hat.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }

        if(leftEye.position.x > CGFloat(450) && leftEye.position.x <= CGFloat(600)) // x [450, 600] y [288, 400]
        {
            if(leftEye.position.y > CGFloat(288) && leftEye.position.y <= CGFloat(400)) // x [450, 600] y [288, 400]
            {
                if(rightPlaced == 0 && mouthPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = onlyLeft
                }
                if(rightPlaced == 0 && mouthPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = leftHat
                }
                if(rightPlaced == 0 && mouthPlaced == 1 && hatPlaced == 0)
                {
                    selectedTexture = leftMouth
                }
                if(rightPlaced == 0 && mouthPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = leftMouthHat
                }
                if(rightPlaced == 1 && mouthPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = leftRight
                }
                if(rightPlaced == 1 && mouthPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = leftRightHat
                }
                if(rightPlaced == 1 && mouthPlaced == 1 && hatPlaced == 0)
                {
                    selectedTexture = leftRightMouth
                }
                if(rightPlaced == 1 && mouthPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = fullFace
                }
                    
                blankFace.size.height = selectedTexture.size().height / CGFloat(scale)
                blankFace.size.width = selectedTexture.size().width / CGFloat(scale)

                print("BAZINGA2")
                resetAllNodeLocation()
                leftEye.run(SKAction.removeFromParent())
                blankFace.texture = selectedTexture
                leftPlaced = 1;
            
            }
        }
        if(rightEye.position.x > CGFloat(650) && rightEye.position.x <= CGFloat(800)) // x [450, 600] y [288, 400]
        {
            if(rightEye.position.y > CGFloat(255) && rightEye.position.y <= CGFloat(400)) // x [450, 600] y [288, 400]
            {
                if(leftPlaced == 0 && mouthPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = onlyRight
                }
                if(leftPlaced == 0 && mouthPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = rightHat
                }
                if(leftPlaced == 0 && mouthPlaced == 1 && hatPlaced == 0)
                {
                    selectedTexture = rightMouth
                }
                if(leftPlaced == 0 && mouthPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = rightMouthHat
                }
                if(leftPlaced == 1 && mouthPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = leftRight
                }
                if(leftPlaced == 1 && mouthPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = leftRightHat
                }
                if(leftPlaced == 1 && mouthPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = fullFace
                }
                
                blankFace.size.height = selectedTexture.size().height / CGFloat(scale)
                blankFace.size.width = selectedTexture.size().width / CGFloat(scale)

                
                print("BAZINGA2")
                resetAllNodeLocation()
                rightEye.run(SKAction.removeFromParent())
                blankFace.texture = selectedTexture
                rightPlaced = 1;
            
            }
        }
        if(mouth.position.x > CGFloat(500) && mouth.position.x <= CGFloat(750)) // x [450, 600] y [288, 400]
        {
            if(mouth.position.y > CGFloat(114) && mouth.position.y <= CGFloat(263)) // x [450, 600] y [288, 400]
            {
                if(leftPlaced == 0 && rightPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = onlyMouth
                }
                if(leftPlaced == 0 && rightPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = mouthHat
                }
                if(leftPlaced == 0 && rightPlaced == 1 && hatPlaced == 0)
                {
                    selectedTexture = rightMouth
                }
                if(leftPlaced == 0 && rightPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = rightMouthHat
                }
                if(leftPlaced == 1 && rightPlaced == 0 && hatPlaced == 0)
                {
                    selectedTexture = leftMouth
                }
                if(leftPlaced == 1 && rightPlaced == 0 && hatPlaced == 1)
                {
                    selectedTexture = leftMouthHat
                }
                if(leftPlaced == 1 && rightPlaced == 1 && hatPlaced == 1)
                {
                    selectedTexture = fullFace
                }
                
                blankFace.size.height = selectedTexture.size().height / CGFloat(scale)
                blankFace.size.width = selectedTexture.size().width / CGFloat(scale)

                
                print("BAZINGA2")
                resetAllNodeLocation()
                mouth.run(SKAction.removeFromParent())
                blankFace.texture = selectedTexture
                mouthPlaced = 1;
            
            }
        }
        if(hat.position.x > CGFloat(450) && hat.position.x <= CGFloat(750)) // x [450, 600] y [288, 400]
        {
            if(hat.position.y > CGFloat(432) && hat.position.y <= CGFloat(500)) // x [450, 600] y [288, 400]
            {
                if(leftPlaced == 0 && rightPlaced == 0 && mouthPlaced == 0)
                {
                    selectedTexture = onlyHat
                }
                if(leftPlaced == 0 && rightPlaced == 0 && mouthPlaced == 1)
                {
                    selectedTexture = mouthHat
                }
                if(leftPlaced == 0 && rightPlaced == 1 && mouthPlaced == 0)
                {
                    selectedTexture = rightHat
                }
                if(leftPlaced == 0 && rightPlaced == 1 && mouthPlaced == 1)
                {
                    selectedTexture = rightMouthHat
                }
                if(leftPlaced == 1 && rightPlaced == 0 && mouthPlaced == 0)
                {
                    selectedTexture = leftHat
                }
                if(leftPlaced == 1 && rightPlaced == 0 && mouthPlaced == 1)
                {
                    selectedTexture = leftMouthHat
                }
                if(leftPlaced == 1 && rightPlaced == 1 && mouthPlaced == 1)
                {
                    selectedTexture = fullFace
                }
                
                blankFace.size.height = selectedTexture.size().height / CGFloat(scale)
                blankFace.size.width = selectedTexture.size().width / CGFloat(scale)
                
                print("BAZINGA2")
                resetAllNodeLocation()
                hat.run(SKAction.removeFromParent())
                blankFace.texture = selectedTexture
                hatPlaced = 1;
            }
        }
        if(selectedTexture == fullFace)
        {
            timerLabel.run(SKAction.removeFromParent())
            vicLabel.text = "GOOD JOB"
            let vicArray = [vic1, vic2, vic3, vic4, vic6, vic7, vic8, vic9, vic10, vic11, vic12, vic13, vic14, vic15, vic16];
            let vicLoop = [vic12, vic13, vic14, vic15, vic16]
            let hatsOff = SKAction.animate(with: vicArray, timePerFrame: 0.1) //must figure out how to animte async
            let loopWiggle = SKAction.animate(with: vicLoop, timePerFrame: 0.1) //must figure out how to animte async
            let repeatAction = SKAction.repeatForever(loopWiggle)
            let sequence = SKAction.sequence([hatsOff, repeatAction])
            
            blankFace.run(sequence)
            
            //then transition back to intro do some kind of pass for score as well
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        

    }
}


