//
//  ViewController.swift
//  amador_rainGame
//
//  Created by student on 11/1/21.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear() {
        super.viewWillAppear()
        if let window = view.window,let screen = window.screen {
            let visibleScreen = screen.visibleFrame
            let newFrame = NSRect(x: visibleScreen.origin.x + 200.0, y: visibleScreen.origin.y + 200.0, width: visibleScreen.width - 200.0, height: visibleScreen.height - 200.0)//CHANGE LATER
            window.setFrame(newFrame, display: true)
        }
        let helloScene = Intro(size: view.frame.size)
        let spriteKitView = SKView(frame: view.frame)
        view = spriteKitView
        spriteKitView.presentScene(helloScene)
        
        
    }

}

