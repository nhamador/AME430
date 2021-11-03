//
//  TableHelper.swift
//  SpaceX
//
//  Created by Loren Olson on 10/6/21.
//

import Cocoa

// This small object works as the data source and the delegate for the
// launches tableview. (The second, smaller table in the UI.)

class TableHelper: NSObject, NSTableViewDataSource, NSTableViewDelegate {
    
    var launches: [String] = []
    
    var tableView: NSTableView!
    
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return launches.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let tc = tableColumn, let cell = tableView.makeView(withIdentifier: tc.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        cell.textField?.stringValue = launches[row]
        
        return cell
    }
}
