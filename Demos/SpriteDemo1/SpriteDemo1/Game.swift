//
//  Game.swift
//  SpriteDemo1
//
//  Created by student on 10/20/21.
//

import Cocoa
import SpriteKit

class Game: SKScene {
    
    override func didMove(to view: SKView){
        backgroundColor = SKColor.green
        
        let textNode = SKLabelNode(text: "Game")
        textNode.position = CGPoint(x: frame.midX, y: frame.midY)
    }
}
