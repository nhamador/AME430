//
//  feedCat.swift
//  amador_game
//
//  Created by student on 11/30/21.
//

import Cocoa
import SpriteKit

class feedCat: SKScene, SKPhysicsContactDelegate
{

    
    @objc func fireTimer() { //need real thing here for if you fail
        print("BAZINGA BAZGINGA BAZGAINA")
    }
    //let timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    var timerLabel = SKLabelNode(fontNamed: "PartyLetPlain")
    var vicLabel = SKLabelNode(fontNamed: "MarketFelt-Wide")
    var header = SKLabelNode(fontNamed: "Papyrus")
    var timerVal: Int = 120 {
        didSet {
            timerLabel.text = "\(timerVal)"
        }
    }
    var donut: SKSpriteNode!
    var chicken: SKSpriteNode!
    var candy: SKSpriteNode!
    var burger: SKSpriteNode!
    var cat: SKSpriteNode!
    
    let catMouth = SKTexture(imageNamed: "catMouth")
    let donutText = SKTexture(imageNamed: "donut")
    let candyText = SKTexture(imageNamed: "candy")
    let chickenText = SKTexture(imageNamed: "chicken")
    let cheeseText = SKTexture(imageNamed: "cheeseburger")
    override func didMove(to view: SKView)
    {
        header.position = CGPoint(x: frame.midX - 350.0, y: frame.midY + 185.0)
        header.fontSize = 120.0;
        header.fontColor = SKColor.systemBlue
        header.text = "FEED ME"
        addChild(header)
        
        
        backgroundColor = SKColor.green
        physicsWorld.contactDelegate = self
        cat = SKSpriteNode(texture: catMouth)
        cat.position = CGPoint(x: frame.midX, y: frame.midY)
        cat.size = CGSize(width: frame.width/2, height: frame.height/2)
        cat.name = "hungry"
        
        let foodSize = CGSize(width: frame.width/5, height: frame.height/5)
        
        donut = SKSpriteNode(texture: donutText)
        donut.position = CGPoint(x: frame.midX, y: frame.midY + CGFloat(200))
        donut.size = foodSize
        donut.name = "donut"
        
        candy = SKSpriteNode(texture: candyText)
        candy.position = CGPoint(x: frame.midX - CGFloat(400), y: frame.midY)
        candy.size = foodSize
        candy.name = "candy"
        
        chicken = SKSpriteNode(texture: chickenText)
        chicken.position = CGPoint(x: frame.midX + CGFloat(400), y: frame.midY)
        chicken.size = foodSize
        chicken.name = "chicken"
        
        burger = SKSpriteNode(texture: cheeseText)
        burger.position = CGPoint(x: frame.midX, y: frame.midY - CGFloat(200))
        burger.size = foodSize
        burger.name = "chicken"
        
        addChild(burger)
        addChild(chicken)
        addChild(candy)
        addChild(cat)
        addChild(donut)
    }
    override func mouseDragged(with event: NSEvent)
    {
        
        let point = event.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == donut) {
            donut.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == burger) {
            burger.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == chicken) {
            chicken.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == candy) {
            candy.position = (CGPoint(x: CGFloat(point.x), y: CGFloat(point.y)))
        }
        
        if(nodesAtPoint[0] == candy && nodesAtPoint[1] == cat) || (nodesAtPoint[1] == candy && nodesAtPoint[0] == cat)
        {
            //donut.removeFromParent()
            
        }
    }
    override func mouseUp(with event: NSEvent)
    {
        let point = event.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if(nodesAtPoint[0] == donut && nodesAtPoint[1] == cat) || (nodesAtPoint[1] == donut && nodesAtPoint[0] == cat)
        {
            donut.removeFromParent()
        }
        if(nodesAtPoint[0] == burger && nodesAtPoint[1] == cat) || (nodesAtPoint[1] == burger && nodesAtPoint[0] == cat)
        {
            burger.removeFromParent()
            //win
            
        }
        if(nodesAtPoint[0] == chicken && nodesAtPoint[1] == cat) || (nodesAtPoint[1] == chicken && nodesAtPoint[0] == cat)
        {
            chicken.removeFromParent()
        }
        if(nodesAtPoint[0] == candy && nodesAtPoint[1] == cat) || (nodesAtPoint[1] == candy && nodesAtPoint[0] == cat)
        {
            candy.removeFromParent()
        }
    }
    
 
    

    
}
