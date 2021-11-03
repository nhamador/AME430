//
//  Intro.swift
//  amador_rainGame
//
//  Created by student on 11/1/21.
//

import Cocoa
import SpriteKit
var gameStart = 0;
class Intro: SKScene
{
    let textNode = SKLabelNode(text: "rain game")
    let buttonNode = SKLabelNode(text: "PLAY")
    override func didMove(to view: SKView)
    {
        backgroundColor = SKColor.blue
        textNode.position = CGPoint(x: frame.midX, y: frame.midY)
        textNode.fontSize = 60
        if(gameStart == 1){
            //backgroundColor = SKColor.white
            textNode.fontSize = 100;
            textNode.text = "YOU WON"
            buttonNode.text = "Play again?"
        }
        addChild(textNode)
        buttonNode.position = CGPoint(x: frame.midX, y: (frame.midY - (1/3)*frame.midY))
        addChild(buttonNode)
    }
    override func mouseDown(with event: NSEvent)
    {
        guard let view = view else { return }
        let point = event.location(in: self)
        let nodesAtPoint = nodes(at: point)
        if (nodesAtPoint.count > 0)&&(nodesAtPoint[0] == buttonNode) {
            let gameScene = Game(size: view.frame.size)
            let transition = SKTransition.flipHorizontal(withDuration: 0.5)
            view.presentScene(gameScene, transition: transition)
            gameStart = 1;
        }
    }
}


