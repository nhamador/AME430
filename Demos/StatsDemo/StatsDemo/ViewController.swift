//
//  ViewController.swift
//  StatsDemo
//
//  Created by student on 9/15/21.
//

import Cocoa

class ViewController: NSViewController {
    var player: Batter
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Batter.loadBatter()
        
        //do any additional setup after loading the view
    }
}
