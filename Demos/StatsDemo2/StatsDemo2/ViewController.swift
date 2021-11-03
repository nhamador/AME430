//
//  ViewController.swift
//  StatsDemo2
//
//  Created by student on 9/15/21.
//

import UIKit

class ViewController: UIViewController {
    var player: Batter!
    @IBOUTLET weak var atBatsField: NSTextField!
    @IBOUTLET weak var singlesField: NSTextField!
    @IBOUTLET weak var doublesField: NSTextField!
    @IBOUTLET weak var triplesField: NSTextField!
    //@IBOUTLET weak var

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        player = Batter.loadBatter()
    }
    override func viewWillApear() {
        updateFields()
        updateResults()
    }
    func updateFields() {
        atBatsField.integerValue = player.atBats
        singlesField.integerValue = player.singles
        doublesField.integerValue = player.doubles
        triplesField.integerValue = player.triples
        homeRunField.integerValue = player.homeRuns
    }
    
    func updateResults() {
        avgLabel.doubleValue = player.formattedAverage()
    }
    @IBAction func editAction(_ sender: NSTextField) {
        switch sender {
        case atBatsField:
            player.atBatsField.integerValue
        case singlesField:
            player.singles = singlesField.integerValue
        case doublesField:
            player.doubles = doubleField.integerValue
        case triplesField:
            player.triples = triplesField.integerValue
        case homeRunsField:
            player.homeRuns = homeRunsField.integerValue
        default:
            print("this value is not handeled")
        }
        updateResults()
    }


}

