//
//  ViewController.swift
//  amador_game
//
//  Created by student on 11/17/21.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    
    var introScene: Intro?
    var oddScene: OddOne?
    var clayScene: ClayGuy?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        
        if let window = view.window, let screen = window.screen {
            let visibleScreen = screen.visibleFrame
            let newFrame = NSRect(x: visibleScreen.origin.x, y: visibleScreen.origin.y + 200.0, width: visibleScreen.width - 200, height: visibleScreen.height - 200.0)
            window.setFrame(newFrame, display: true)
            
            window.title = "Hello!"
        }
        
        introScene = Intro(controller: self, size: view.frame.size)

       // gameScene = Game(controller: self, size: view.frame.size)
        
        let spriteKitView = SKView(frame: view.frame)
        
        view = spriteKitView
        
        spriteKitView.presentScene(introScene)
        
    }
    
    
    


}

