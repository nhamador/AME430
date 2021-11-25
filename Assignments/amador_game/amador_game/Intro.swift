//
//  Intro.swift
//  amador_game
//
//  Created by student on 11/17/21.
//

import Cocoa
import SpriteKit

class Intro: SKScene {
    var controller: ViewController
    
    init(controller: ViewController, size: CGSize){
        self.controller = controller
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView){
        
        backgroundColor = SKColor.blue
        
        let textNode = SKLabelNode(text: "Hello there")
        textNode.position = CGPoint(x: frame.midX, y: frame.midY)
        textNode.fontSize = 60
        addChild(textNode)
    }
    override func mouseUp(with event: NSEvent) {
        guard let view = view else { return }

        let gameScene = OddOne(size: view.frame.size)
        let transition = SKTransition.flipHorizontal(withDuration: 0.5)
        view.presentScene(gameScene, transition: transition)
    }
}
