//
//  ViewController.swift
//  StatsDemoFinal
//
//  Created by student on 9/24/21.
//

import Cocoa

class ViewController: NSViewController {
    var state: Rain!
    
    @IBOutlet weak var springField: NSTextField!
    @IBOutlet weak var summerField: NSTextField!
    @IBOutlet weak var fallField: NSTextField!
    @IBOutlet weak var winterField: NSTextField!
    
    @IBOutlet weak var avgLabel: NSTextField!
    
    override func viewWillAppear() {
        updateFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        state = Rain.loadRain()
    }
    func updateFields() {
        springField.integerValue = state.rainSpring
        summerField.integerValue = state.rainSummer
        fallField.integerValue = state.rainFall
        winterField.integerValue = state.rainWinter
    }
    func updateResults() {
        avgLabel.stringValue = state.formattedAverage()
    }
    
    @IBAction func editAction(_ sender: NSTextField) {
        switch sender {
        case springField:
            state.rainSpring = springField.integerValue
        case summerField:
            state.rainSummer = summerField.integerValue
        case fallField:
            state.rainFall = fallField.integerValue
        case winterField:
            state.rainWinter = winterField.integerValue
        default:
            print("This value is not handeled")
        }
        updateResults()
    }
    
}

