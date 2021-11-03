//
//  ViewController.swift
//  SpriteDemo1
//
//  Created by student on 10/20/21.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    override func viewWillAppear() {
        super.viewWillAppear()
        if let window = view.window,let screen = window.screen {
            let visibleScreen = screen.visibleFrame
            window.setFrame(visibleScreen, display: true)
        }
        let helloScene = Hello(size: view.frame.size)
        let spriteKitView = SKView(frame: view.frame)
        view = spriteKitView
        spriteKitView.presentScene(helloScene)
        
        
    }
}

